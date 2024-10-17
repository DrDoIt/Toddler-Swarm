extends Node2D

signal won

@onready var main: Node = $"../.."

var padding_x = 20
var padding_y = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$YouWon.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Get window size
	var window_size = DisplayServer.window_get_size()
	
	# Aesthetics
	$ToddlerCount.position.y = 13
	$ToddlerCount.position.x = window_size.x - $ToddlerCount.size.x - padding_x
	$Stopwatch.position.x = $Label.position.x
	$Stopwatch.position.y = $Label.position.y + $Label.size.y + padding_y
	$ColorRect.size.x = $Label.size.x + padding_x
	$ColorRect.size.y = $Label.size.y + 2 * padding_y + $Stopwatch.size.y
	$ColorRect.position.x = $Label.position.x - padding_x/2
	$ColorRect.position.y = $Label.position.y - padding_y/2 + 2
	$ColorRect2.size.x = $ToddlerCount.size.x + padding_x
	$ColorRect2.size.y = $ToddlerCount.size.y + padding_y
	$ColorRect2.position.x = $ToddlerCount.position.x - padding_x/2
	$ColorRect2.position.y = $ToddlerCount.position.y - padding_y/2 + 2
	# YouWon label position
	$YouWon.position.x = window_size.x/2 - $YouWon.size.x/2
	$YouWon.position.y = window_size.y/4 -$YouWon.size.y/3
	
	# Score update
	var attemptCount = $"../../Player".attempt
	var toddlerCount = main.toddlerCount
	var maxToddlerCount = 10
	
	if toddlerCount == maxToddlerCount:
		$ToddlerCount.hide()
		$Stopwatch.hide()
		$ColorRect.hide()
		$ColorRect2.hide()
		$Label.hide()
		gameOver()

	$Label.text = str("Attempt ",attemptCount)
	$ToddlerCount.text = str("Toddlers Brought Home: ", toddlerCount,"/",maxToddlerCount)

func gameOver():
	$YouWon.show()
	won.emit()
