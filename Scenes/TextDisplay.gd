extends RichTextLabel


var s = 0
var m = 0
var z = 0

func _process(delta):
	
	if s > 59:
		m += 1
		s = 0
		
	if s > 9:
		z = ""
	else:
		z = 0
	set_text(str(m)+":"+str(z)+str(s))
	pass
	


func _on_S_timeout():
	s += 1
	pass # Replace with function body.
