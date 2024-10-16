extends Node

signal attempts

@export var yogurt_scene: PackedScene
@export var enemy_scene: PackedScene

var screen_size
var yogurtSpotted = false
var toddlerCount = 0

static var toddlerTarget

func _ready() -> void:
	pass
	#screen_size = 
	
func _process(delta: float) -> void:
	for child in self.find_children("*"):
		if child.is_in_group("Toddlers"):
			var toddler = child
			if not yogurtSpotted and toddler.chasing == true:
				toddlerTarget = $Player
			elif yogurtSpotted:
				pass
			else:
				toddlerTarget = toddler
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

func _on_toddler_chasing() -> void:
	pass # Replace with function body.


func _on_player_hit() -> void:
	attempts.emit()
	$Player.respawn($PlayerSpawn.position)


func _on_play_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Toddlers"):
		body.queue_free()
		toddlerCount += 1
