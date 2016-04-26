require 'core.ECS.system'
require 'core.ECS.entity'
require 'core.ECS.component'

function core.reset_game()
	game = {}
	game.entities= {}
	game.systems = {}
	game.update_systems = {}
	game.draw_systems = {}
end