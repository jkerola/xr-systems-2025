extends Node3D
var rot = 0
var speed = 150


func _process(delta: float):
	rot = deg_to_rad(rot + delta * speed )
	self.rotate(Vector3.UP, rot)
