tag pending

	def setup
		@collection = Collection:list[L.ns(__dirname, :get_pending)].new.load

	def render
		<self><commit_list[@collection]>
