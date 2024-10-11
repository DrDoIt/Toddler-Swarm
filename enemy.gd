extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if linear_velocity != Vector2(0,0):
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	if linear_velocity >= Vector2(0,0):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.flip_h = false
	elif linear_velocity <= Vector2(0,0):
		$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.flip_h = true
		
