extends Node


func _ready():
	var rand = RandomNumberGenerator.new()
	var blockscene = load("res://Scenes/Block_1.tscn")
	var spikescene = load("res://Scenes/Spikes.tscn")
	global.dead = 0
	
	for i in range(0,10):
		var block = blockscene.instance()
		rand.randomize()
		var x = rand.randf_range(-900, 900)
		rand.randomize()
		var y = rand.randf_range(-900, 900)
		rand.randomize()
		var r = rand.randf_range(0, 359)
		block.position.y = y
		block.position.x = x
		block.rotation = r
		add_child(block)
		
	for i in range(0,5):
		var spike = spikescene.instance()
		rand.randomize()
		var x = rand.randf_range(-936, 936)
		rand.randomize()
		var y = rand.randf_range(-936, 936)
		rand.randomize()
		var r = rand.randf_range(0, 359)
		spike.position.y = y
		spike.position.x = x
		spike.rotation = r
		add_child(spike)

func _physics_process(delta):
	if global.dead == 1:
		global.dead = 0
		get_tree().change_scene("res://Scenes/DeathScreen.tscn")
	global.player = get_node("Player/Player/Camera2D").global_position
	
	print(str("Player: ",get_node("Player/Player")))
