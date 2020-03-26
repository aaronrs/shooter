extends RichTextLabel

onready var a 
onready var b
onready var c
onready var d


func _ready():
	global.score = 0

func _process(delta):

	if global.score < 10:
		a = " "
		b = " "
		c = " "
		d = " "
	if global.score > 9:
		a = ""
		b = " "
		c = " "
		d = " "
	if global.score >99:
		a = ""
		b = ""
		c = " "
		d = " "
	if global.score > 999:
		a = ""
		b = ""
		c = ""
		d = " "
	if global.score > 9999:
		a = ""
		b = ""
		c = ""
		d = ""

	set_text(str(d)+str(c)+str(b)+str(a)+str(global.score))

func _on_S_timeout():
	global.score += 10
