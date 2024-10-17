extends CharacterBody2D

signal dropped()
signal hit

@export var speed = 300.0
const JUMP_VELOCITY = -400.0
static var attempt = 1
var dropable = true
var direction : float

func _ready():
	$AnimatedSprite2D.play()

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
	if velocity != Vector2(0,0):
		rotation = velocity.angle()
		direction = rotation
	else:
		pass
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("Toddlers"):
			hit.emit()
			print("respawn")

func _on_throw_timer_timeout() -> void:
	dropable = true
	
func respawn(pos):
	position = pos
	attempt += 1

func warp(pos):
	position = pos
