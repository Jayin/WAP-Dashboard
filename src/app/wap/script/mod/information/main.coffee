app = require 'app'
Skateboard = require 'skateboard'
$ = require 'jquery'
React = require 'react'
EventList = require '../../component/EventList/main'

class Mod extends Skateboard.BaseMod
	cachable: true

	# events:
	# 	'click #btn-submit': 'submit'
	# 	'click #btn-register': 'register'
	#

	_bodyTpl: require './body.tpl.html'

	website: null

	_afterFadeIn: =>
		@updateState()


	render: =>
		super
		@updateState()


	updateState: =>
		@website = G.state.get('website')
		console.log @website
		app.ajax.get
			url: '/api/v1/website/{website_id}/events'.replace('{website_id}', @website._id)
			success: (res)=>
				console.log(res)
				React.render(
					React.createElement(EventList, {events: res}),
					document.getElementById('container-event-list')
				)
			error:(err)=>
				app.alerts.alert '网络繁忙，请稍后再试'

module.exports = Mod
