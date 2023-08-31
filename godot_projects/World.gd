extends Node2D


var Laser = preload("res://projectiles/PlayerLaser.tscn")
var Controls = preload("res://Main/Controls.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Health.text = "HEALTH: " + str($Player.hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var score = 0

func _on_Player_spawn_laser(location):
	var l = Laser.instantiate()
	l.global_position = location
	add_child(l)

func add_score():
	score += 10
	$Score.text = "SCORE: " + str(score)
	
func injury():
	$Health.text = "HEALTH: " + str($Player.hp)

func _on_Player_load_munitions(munitions_value):
	$Munitions.text = "MUNITIONS: " + str(munitions_value)


