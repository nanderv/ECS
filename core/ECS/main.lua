require 'core.ECS.system'
require 'core.ECS.entity'
require 'core.ECS.component'

function core.reset_game()
	if game then
		-- cleanup
		print("RESETTING")
	end
	models = {}
	models.entity_types = {}
	models.component_types = {}
	models.system_types = {}

	game = {}
	game.entities= {}
	game.systems = {}
	game.system_categories = {}
	game.thread_count = 0
end