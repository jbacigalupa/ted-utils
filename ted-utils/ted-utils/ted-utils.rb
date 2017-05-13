module TedUtils

def self.active_view
	Sketchup.active_model.active_view
end

def self.camera
	active_view.camera
end

# set the active camera's aspect ratio to be locked to whatever
# the current viewport size is
def self.set_aspect_from_view
	aspect = active_view.vpwidth.to_f / active_view.vpheight
	current_aspect = camera.aspect_ratio

	return if aspect==current_aspect
	
	camera.aspect_ratio = aspect
	if aspect > current_aspect
		focal_fix = current_aspect==0.0 ? aspect : aspect / current_aspect
		camera.focal_length /= focal_fix
	end
end

if not defined? TedUtils::UI_LOADED
	menu = UI.menu('Plugins')
	ted_utils = menu.add_submenu("Ted Utils")
	ted_utils.add_item("Set aspect ratio from view"){ TedUtils.set_aspect_from_view }
	UI_LOADED=true
end

end # module TedUtils