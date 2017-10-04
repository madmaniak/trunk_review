tag #app

	def build
		R.init root: 'pending', helpers: L, render: L.throttle self:render.bind(self), 17

	def render
		document:title = "Code Review - {R:view}"
		dom:className = R:view
		<self>
			<h1> "Code Review"
			<mainmenu>
			<router>
