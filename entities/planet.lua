function get_new_planet(x,y,w)
 	entity = {}

	entity.position = {x=x,y=y}
	entity.velocity = {x=0,y=0}
	entity.acceleration = {x=0,y=0}
	entity.mass = {mass = w}

	return entity

end