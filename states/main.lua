local states = {}
states.menu = require 'states.menu'
states.main = require 'states.game'
states.pause = require 'states.pause'
states.loading = require 'states.loading'
states.death = require 'states.death'
states.victory = require 'states.victory'
states.settingsmenu = require 'states.settings'
states.helpmenu = require 'states.help'
return states