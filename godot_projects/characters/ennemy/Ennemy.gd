extends Area2D

signal enemy_died

@export (int) var speed = 150

var hp = 1

func _physics_process(delta):
	global_position.y += speed*delta

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
		emit_signal("enemy_died")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Enemy_area_entered(area):
	if area is Player:
		area.take_damage(1)
