extends Node


@export var yogurt_scene: PackedScene
@export var enemy_scene: PackedScene


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	#var spawn = enemy_scene.instantiate()
	#add_child(spawn)
	for child in self.find_children("*"):
		if child.is_in_group("Toddlers"):
			var toddler = child
			var velocity = toddler.position.direction_to($Player.position) * 100
			toddler.linear_velocity = velocity
			
			





func _on_player_dropped() -> void:
	var instance = yogurt_scene.instantiate()
	instance.dir = $Player.rotation
	instance.spawnPos = $Player.global_position
	instance.spawnRot = $Player.rotation
	add_child.call_deferred(instance)
