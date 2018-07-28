extends Area2D

var scanner_area
var label
var is_colliding

func _ready():
	scanner_area = $"."
	label = $UI/Label
	is_colliding = false

func _process(delta):
	if (Input.is_action_just_pressed("interact") && is_colliding):
		label.text = "You have pressed E and you are colliding!"
		

func _on_Scanner_Area_body_entered(body):
	if body.name == "Player":
		# Show some floating text above the object
		label.text = "Press 'E' to interact"
		label.set_visible(true)
		
		is_colliding = true
	print(body.name)


func _on_Scanner_Area_body_exited(body):
	print(body.name + " has left")
	label.set_visible(false)
	is_colliding = false