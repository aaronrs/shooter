extends RichTextLabel


onready var s = 0
onready var m = 0

func _process(delta):
	if s > 59:
		m += 1
		s = 0
	
	set_text(str(m)+":"+str(s))
	pass


func _on_s_timeout():
	s += 1
	pass # Replace with function body.
