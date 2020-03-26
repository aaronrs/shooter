extends KinematicBody2D

var speed := 300
var motion := Vector2()
var bullet = preload("res://Scenes/Bullet.tscn")
var bullet_speed = 1000
var fire_rate = 0.5
var can_fire = true


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		motion.y = speed
	elif Input.is_action_pressed("ui_up"):
		motion.y = -speed
	else:
		motion.y = 0
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
		

	
	move_and_slide(motion)
	
	
func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("fire")and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $Bullet_pos.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true

