extends Node2D

signal add_score


var spawn_positions = null


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Enemy = preload("res://characters/ennemy/Ennemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Spawn !")
	randomize()
	spawn_positions = $SpawnPositions.get_children()

func spawn_enemy():
	var index = randi() % spawn_positions.size()
	var enemy = Enemy.instantiate()
	enemy.global_position = spawn_positions[index].global_position
	enemy.connect("enemy_died", Callable(self, "enemy_died"))
	add_child(enemy)

func enemy_died():
	print("enemy died")
	emit_signal("add_score")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_SpawnTimer_timeout():
	spawn_enemy()

