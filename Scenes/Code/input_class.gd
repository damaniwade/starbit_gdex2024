class_name Input_Handle
extends Node

@export_subgroup("ControlVariables")
@export var speed: float = 300.0
@export var jump_velocity: float = -500.0
@export var dash_speed: float = 20000.0
@export var dash_distance: float = 0.3

var dash_ability: bool = true
var is_dashing: bool = false

var x_movement: float = 0.0
var jumped: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	x_movement = Input.get_axis("move_left", "move_right")

func get_jump_input() -> bool:
	return Input.is_action_just_pressed("jump")

func movement_handle(body: CharacterBody2D, delta: float) -> void:
	body.velocity.x = speed * delta
	#code below handles implementation of the dash ability
	#need to make it so the ability is only available after
	#getting the power up
	if Input.is_action_just_pressed("dash") and dash_ability:
		body.velocity.x = dash_speed * delta
		dash_ability = false
		is_dashing = true
		
		await(get_tree().create_timer(dash_distance)).timeout
		is_dashing = false
		dash_ability = true

func jump_handle(body: CharacterBody2D, jump_delta: float) -> void:
	if jump_delta and body.is_on_floor():
		body.velocity.y = jump_velocity
	
	jumped = body.velocity.y < 0 and not body.is_on_floor() 
