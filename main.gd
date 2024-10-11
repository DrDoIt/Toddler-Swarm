extends Node


@export var yogurt_scene: PackedScene
@export var enemy_scene: PackedScene
var yogurtSpotted = false
var yogurtList = []

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	#var spawn = enemy_scene.instantiate()
	#add_child(spawn)
	for child in self.find_children("*"):
		if child.is_in_group("Toddlers"):
			var toddler = child
			if not yogurtSpotted:
				Global.toddlerTarget = $Player.position
			else:
				pass
			var velocity = toddler.position.direction_to(Global.toddlerTarget) * 100
			toddler.linear_velocity = velocity

func _on_player_dropped() -> void:
	yogurtSpotted = true
	var instance = yogurt_scene.instantiate()
	instance.dir = $Player.rotation
	instance.spawnPos = $Player/Marker2D.global_position
	instance.spawnRot = $Player.rotation
	add_child.call_deferred(instance)
	yogurtSpotted = true

func _on_child_entered_tree(node: Node) -> void:
	if node.is_in_group("Yogurt"):
		#yogurtList.append(node.position)
		#Global.toddlerTarget = yogurtList[0]
		#print(yogurtList)
		print("yogurt")
		yogurtSpotted = true
