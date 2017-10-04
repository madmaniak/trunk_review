require 'disque'
require 'oj'
require 'webrick'
require_relative 'helpers/monkey_patches'

dis = Disque.new(["#{ENV['disque_host']}:#{ENV['disque_port']}"])
Oj.default_options = { symbol_keys: true, mode: :compat }
server = WEBrick::HTTPServer.new :Port => 7777

server.mount_proc "/add" do |req, res|
  req.body.split("\n").map { |commit|
    commit =~ /\+ (.+) \*/; $1
  }.each do |hash|
    dis.que :addjob, "front/framework/services/store/add",
      Oj.dump(object: { type: 'commits', time: DateTime.now, hash: hash, status: 'pending', id: 0 }, sid: "0", r: 0, relations: [['app/pending/get_pending',1]]), 60, :replicate, 1, :retry, 0, :ttl, 2
  end
end

server.start
