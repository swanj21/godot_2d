extends Area2D

var scanner_area
var label

func _ready():
	scanner_area = $"."
	label = $UI/Label

func _on_Scanner_Area_body_entered(body):
	# Show some floating text above the object
	
	if body.name == "Player":
		# Manipulate the label control
		label.text = "Press 'E' to interact"
	
		# Once done, set as visible
		label.set_visible(true)
	
	print(body.name)


func _on_Scanner_Area_body_exited(body):
	label.set_visible(false)