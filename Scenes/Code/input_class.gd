class_name Input_Handle
extends Node

@export var dash_control: Dash_Handle

@export_subgroup("ControlVariables")
@export var speed: float = 300.0
@export var jump_velocity: float = -500.0

var x_movement: float = 0.0
var jumped: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	x_movement = Input.get_axis("move_left", "move_right")
	if Input.is_action_just_pressed("dash"):
		dash_control.dash_handle()
		var temp_speed = dash_control.dash_speed if dash_control.dashing() else speed
		

func get_jump_input() -> bool:
	return Input.is_action_just_pressed("jump")

func movement_handle(body: CharacterBody2D, delta: float) -> void:
	body.velocity.x = speed * delta

func jump_handle(body: CharacterBody2D, jump_delta: float) -> void:
	if jump_delta and body.is_on_floor():
		body.velocity.y = jump_velocity
	
	jumped = body.velocity.y < 0 and not body.is_on_floor() 
