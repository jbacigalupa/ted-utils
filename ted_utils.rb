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
	camera.focal_length /= aspect
	camera.aspect_ratio = aspect
end

end # module TedUtils