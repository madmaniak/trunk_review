tag commit

	def time
		var t = data:time.split('T')
		t[1] = t[1].split('+')[0]
		t.join(' ')

	def render
		<self@{data:id}>
			<h4> time
			<h3> data:hash
			<._mainmenu>
				<ul>
					<reject[data]> if L.includes [:pending, :accepted], R:view
					<accept[data]> if L.includes [:pending, :rejected], R:view
tag action < li

	def move_to status
		var collection = "app/{status}/get_{status}"
		var collection_object = Store:collections[collection]
		collection_object = collection_object[1] if collection_object
		Store.add('commits', L.merge({}, data, status: status), [ collection_object || { type: collection, id: 1 } ] )
		Store.delete(data)


tag reject < action
	def render
		<self._ref> "Reject"

	def onclick
		move_to('rejected')


tag accept < action
	def render
		<self._ref> "Accept"

	def onclick
		move_to('accepted')
