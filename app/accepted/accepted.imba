tag accepted

	def setup
		@collection = Collection:list[L.ns(__dirname, :get_accepted)].new.load

	def render
		<self><commit_list[@collection]>
