extends Node


@export var yogurt_scene: PackedScene
@export var enemy_scene: PackedScene
var yogurtSpotted = false

static var toddlerTarget

func _ready() -> void:
	$CharlieSpawnTime.start()
	
func _process(delta: float) -> void:
	for child in self.find_children("*"):
		if child.is_in_group("Toddlers"):
			var toddler = child
			if not yogurtSpotted:
				toddlerTarget = $Player
			else:
				pass
			var velocity = toddler.position.direction_to(toddlerTarget.position) * 100
			toddler.linear_velocity = velocity

func _on_player_dropped() -> void:
	var instance = yogurt_scene.instantiate()
	instance.dir = $Player.rotation
	instance.spawnPos = $Player/Marker2D.global_position
	instance.spawnRot = $Player.rotation
	add_child.call_deferred(instance)
	

func _on_child_entered_tree(node: Node) -> void:
	if node.is_in_group("Yogurt"):
		toddlerTarget = node
		yogurtSpotted = true


func _on_child_exiting_tree(node: Node) -> void:
	if node.is_in_group("Yogurt"):
		yogurtSpotted = false
		toddlerTarget = $Player


func _on_charlie_spawn_time_timeout() -> void:
	#var spawn = enemy_scene.instantiate()
	#spawn.position = $CharlieSpawn.position
	#spawn.add_to_group("Toddlers")
	#add_child(spawn)
	pass
	
