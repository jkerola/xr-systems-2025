extends Node3D

var xr_interface: XRInterface

func _ready() -> void:
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("Detected interface ", xr_interface.get_name())
		print("OpenXR initialized.")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("Couldn't detect XR interface. Please check connection.")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_right_hand_button_pressed(name: String) -> void:
	match name:
		"ax_button":
			pass
		"by_button":
			get_tree().quit()
		_:
			pass
