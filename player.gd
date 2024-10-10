extends CharacterBody2D

signal dropped()

@export var speed = 300.0
const JUMP_VELOCITY = -400.0
var dropable = true

func _ready():
	pass

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if dropable == true:
		if Input.is_action_pressed("throw"):
			dropped.emit()
			$ThrowTimer.start()
			dropable = false
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		pass

	
	position += velocity * delta
		


func _on_throw_timer_timeout() -> void:
	dropable = true
