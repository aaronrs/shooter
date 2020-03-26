extends Node2D

var x
var y

func _physics_process(delta):
	position = (global.player)
	position.x -= 100
	position.y -= 280
