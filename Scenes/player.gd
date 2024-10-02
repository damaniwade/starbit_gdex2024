extends Node2D

#const GRAVITY  = 200.0

#var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("ui_right"):
		#position += Vector2(150, 0) * delta
	#if Input.is_action_pressed("ui_left"):
		#position -= Vector2(150, 0) * delta
	pass
