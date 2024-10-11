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
	elif linear_velocity <= Vector2(0,0):
		$AnimatedSprite2D.flip_h = true
	
	var collision = move_and_collide(linear_velocity * delta)
	if collision:
		pass
		#print("I collided with ", collision.get_collider().name)
		
	


func _on_aggro_body_entered(body: Node2D) -> void:
	print("ag entered")
