function add_simple_image_component(entity,url,offX,offY)
	core.component.add(entity,"image",{url = url, offX = offX, offY = offY})
	core.component.add(entity,"image_not_yet_available", {})
	core.component.add(entity,"render_still_image", {})
end