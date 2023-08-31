extends Area2D
class_name Player

signal spawn_laser(location)
signal load_munitions(munitions_value)
signal injury

@onready var muzzle = $Muzzle

var speed = 300
var input_vector = Vector2.ZERO
var hp = 3
const MUNITIONS_LOADER = 50
var munitions = MUNITIONS_LOADER

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	global_position += input_vector * speed * delta
	
	if(Input.is_action_just_pressed("reload")):
		munitions = MUNITIONS_LOADER
		emit_signal("load_munitions", munitions)
	
	if(Input.is_action_just_pressed("shoot")):
		if munitions > 0:
			munitions -= 1
			emit_signal("load_munitions", munitions)
			shoot_laser()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func take_damage(damage):
	hp -= damage
	emit_signal("injury")
	if hp <= 0:
		queue_free()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)

func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)

