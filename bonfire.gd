extends Node3D
@onready var fire: GPUParticles3D = $fire
@onready var omni_light_3d: OmniLight3D = $OmniLight3D
var purple = Color("d7876f")
var red = Color("ec4300")
var pink = Color("f2008e")

func _process(delta: float):
	omni_light_3d.light_energy = lerp(omni_light_3d.light_energy, randf(), 0.1)
	

func _on_right_hand_button_pressed(name: String) -> void:
		match name:
			"trigger_click":
				fire.amount = 30
				omni_light_3d.light_color = Color("b351fc")
				print(omni_light_3d.light_color)
				
				
func _on_right_hand_button_released(name: String) -> void:
	match name:
		"trigger_click":
			fire.amount = 12
			omni_light_3d.light_color = purple
			print(omni_light_3d.light_color)
