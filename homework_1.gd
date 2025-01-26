extends Node3D

var xr_interface: XRInterface
@onready var tower_marker: Marker3D = $tower_marker
@onready var world_marker: Marker3D = $world_marker
var in_tower = true
@onready var xr_origin_3d: XROrigin3D = $XROrigin3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("Detected interface ", xr_interface.get_name())
		print("OpenXR initialized.")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("Couldn't detect XR interface. Please check connection.")



func _on_right_hand_button_pressed(name: String) -> void:
	match name:
		"ax_button":
			swap_xr_place()
		"by_button":
			get_tree().quit()
		_:
			pass


func swap_xr_place():
	print("swapping to ", "world" if in_tower else "tower")
	in_tower = !in_tower
	xr_origin_3d.global_position = tower_marker.global_position if in_tower else world_marker.global_position
