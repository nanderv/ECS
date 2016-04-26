require 'core.ECS.system'
require 'core.ECS.entity'
require 'core.ECS.component'

function core.reset_game()
	models = {}
	models.entity_types = {}
	models.component_types = {}
	models.system_types = {}

	game = {}
	game.entities= {}
	game.systems = {}
	game.update_systems = {}
	game.draw_systems = {}
end