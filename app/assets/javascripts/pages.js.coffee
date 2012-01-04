# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# 	
# FlipGame =
#   init: ->
#     @Controller = new FlipGameController;
#     Backbone.history.start()
# 	
#   flipped: 0
# 
# @FlipGame = FlipGame
# 
# 
# #
# # Game Models
# #
# 
# Card = Backbone.Model.extend
#   initialize: ->
# 
# Deck = Backbone.Collection.extend model: Card
# 
# 
# #
# # Game Views
# #
# 
# CardView = Backbone.View.extend
# 	tagName: 'div'
# 	
# 	initialize: (options)->
# 		_.bindAll(this, 'render')
# 		@model.bind('change', @render)
# 	
# 	events:
# 	 	'click': 'click'
# 	
# 	render: ->
# 		$(@el).empty()
# 		if _.isEmpty @model.attributes
# 	      @remove()
# 		else
# 		  if @model.get 'flipped' then @face_up() else @face_down()
# 		
# 		return this
# 	
# 	face_down: ->
# 		$(@el).append( "<span class='card-back'></span>" )
# 		
# 	face_up: ->
# 		name = @model.get 'name'
# 		$(@el).append( "<span class='#{name}'></span>" )
# 	
# 	click: ->
# 		if !@model.get 'flipped'
# 		  @model.set 'flipped': true
# 		  ++FlipGame.flipped
# 		  FlipGame.Controller.check_count()
# 
# 
# #
# # Game Controller
# #
# 
# FlipGameController = Backbone.Router.extend
#   
#   routes:
#     ""   : "root"	
#   		
#   root: ->
#     Deck = new Deck _.shuffle Data
#   		
#     $('#cards-wrapper').find('.four').each (i)->
#       card = Deck.at i
#       card_view = new CardView model: card
#       $(@).append card_view.render().el      	
#   		
#   check_count: ->
#     if FlipGame.flipped %2 is 0
#       $('#cards-wrapper').append('<div id="mask"></div>')
#       t = setTimeout "FlipGame.Controller.check_match()", 1000
# 	
#   check_match: ->
#     flipped_cards = Deck.filter (card)-> card.get('flipped') is true 
#   		
#  	  if flipped_cards[0].get('name') is flipped_cards[1].get('name')
#  	    _(flipped_cards).each (card)-> card.clear() 
# 
#  	  else
#  	    _(flipped_cards).each (card)-> 
#  	      card.set 'flipped': false
#  	      FlipGame.flipped = FlipGame.flipped - 1 
#  	
#     $('#mask').remove()
#     game_over = Deck.all (card)-> _.isEmpty card.attributes
#     if game_over then @end_game()
# 
#   end_game: -> $('#cards-wrapper').empty().append(Markup)	
# 
# Data = [
# 	{name: 'moe',   flipped: false},
# 	{name: 'larry', flipped: false},
# 	{name: 'larry', flipped: false},
# 	{name: 'curly', flipped: false},
# 	{name: 'moe',   flipped: false},				
# 	{name: 'curly', flipped: false}
# ]
# 
# Markup = "<div id='invitation'>"
#            + "<div class='six columns'>"
#              + "<span>We are impressed</span>"
# 	       + "</div>"
# 	   + "</div>"
# 	