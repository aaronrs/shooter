extends KinematicBody2D

export var speed = 300
var motion

func _ready():
	randomize()
	rotation_degrees = rand_range(-180, 180)

func _physics_process(delta):

	var hit = get_node("Ray").get_collider()

	
	motion = Vector2(speed, 0).rotated(rotation)
	move_and_slide(motion)

	
func _on_Timer_timeout():
	randomize()
	rotation_degrees = rand_range(-180, 180)
	randomize()
	$Timer.wait_time = rand_range(0.5, 3)

	
	
	


func _on_Hitbox_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("Bullets"):
		global.score += 100
		queue_free()
	if body.is_in_group("Player"):
		global.dead = 1

func _on_Collision_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("Blocks"):
		rotation_degrees += 180
	if body.is_in_group("Walls"):
		rotation_degrees += 180



	
	
	
