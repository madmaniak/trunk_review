tag rejected

	def setup
		@collection = Collection:list[L.ns(__dirname, :get_rejected)].new.load

	def render
		<self><commit_list[@collection]>
