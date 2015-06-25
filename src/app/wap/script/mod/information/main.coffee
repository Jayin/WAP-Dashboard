app = require 'app'
Skateboard = require 'skateboard'
$ = require 'jquery'
React = require 'react'
EventList = require '../../component/EventList/main'

class Mod extends Skateboard.BaseMod
	cachable: true

	events:
		'click #information-btn-pre': 'prePage'
		'click #information-btn-next': 'nextPage'

	_bodyTpl: require './body.tpl.html'

	website: null
	pageSelector: null

	_afterFadeIn: =>
		@loadEvents(1)


	render: =>
		super

		@pageSelector = $('#information-page-index')
		@loadEvents(1)

	prePage: =>
		page = parseInt(@pageSelector.text())
		if page - 1 > 0
			@loadEvents(page - 1)

	nextPage: =>
		page = parseInt(@pageSelector.text())
		@loadEvents(page + 1)



	loadEvents: (page=1, pageSize=10)=>
		@website = G.state.get('website')

		@pageSelector.text(page)
		app.ajax.get
			url: '/api/v1/website/{website_id}/events?page={page}&pageSize={pageSize}'.replace('{website_id}', @website._id).replace('{page}', page).replace('{pageSize}', pageSize)
			success: (res)=>
				React.render(
					React.createElement(EventList, {events: res}),
					document.getElementById('container-event-list')
				)
			error:(err)=>
				app.alerts.alert '网络繁忙，请稍后再试'

module.exports = Mod
