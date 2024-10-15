extends CharacterBody2D

@export var speed = 100

var dir : float
var spawnPos: Vector2
var spawnRot : float
var moving = true

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot 
	$MoveTimer.start() 
	
func _physics_process(delta: float) -> void:
	if moving:
		velocity = Vector2(-speed,0).rotated(dir)
	move_and_slide()

func _on_move_timer_timeout() -> void:
	velocity = Vector2(0,0)
	moving = false


func _on_eating_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Toddler"):
		queue_free()
