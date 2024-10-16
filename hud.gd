extends Node2D

@onready var main: Node = $"../.."

var padding_x = 20
var padding_y = 10



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Get window size
	var window_size = DisplayServer.window_get_size()
	
	# Aesthetics
	$ToddlerCount.position.y = 13
	$ToddlerCount.position.x = window_size.x - 215
	$Stopwatch.position.x = $Label.position.x
	$Stopwatch.position.y = 50
	$ColorRect.size.x = $Label.size.x + padding_x
	$ColorRect.size.y = $Label.size.y + padding_y
	$ColorRect.position.x = $Label.position.x - padding_x/2
	$ColorRect.position.y = $Label.position.y - padding_y/2 + 2
	$ColorRect2.size.x = $ToddlerCount.size.x + padding_x
	$ColorRect2.size.y = $ToddlerCount.size.y + padding_y
	$ColorRect2.position.x = $ToddlerCount.position.x - padding_x/2
	$ColorRect2.position.y = $ToddlerCount.position.y - padding_y/2 + 2
	
	# Score update
	var attemptCount = $"../../Player".attempt
	var toddlerCount = main.toddlerCount

	$Label.text = str("Attempt ",attemptCount)
	$ToddlerCount.text = str("Toddlers brought home: ", toddlerCount)
	
