extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 1000

func _physics_process(delta):
	global_position.y += -speed * delta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_PlayerLaser_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)
		queue_free()
