app = require 'app'
Skateboard = require 'skateboard'
$ = require 'jquery'
React = require 'react'
WebsiteList = require '../../component/WebsiteList/main'

class Mod extends Skateboard.BaseMod
	cachable: true

	# events:
	# 	'click #btn-submit': 'submit'
	# 	'click #btn-register': 'register'
	#

	_bodyTpl: require './body.tpl.html'


	render: =>
		super
		app.ajax.get
			url: '/api/v1/websites'
			success: (res)=>
				console.log(res)
				React.render(
					React.createElement(WebsiteList, {websites: res}),
					document.getElementById('container-website-list')
				)
			error:(err)=>
				console.log(err)
				alert('error')

module.exports = Mod
