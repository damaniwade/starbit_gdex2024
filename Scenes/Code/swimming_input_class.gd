class_name Swim_Input_Handle
extends Node

@export_subgroup("ControlVariables")
@export var swim_speed: float = 200.0
@export var jump_velocity: float = -300.0
@export var boat_speed: float = 600.0
@export var dash_speed: float = 15000.0
@export var dash_distance: float = 0.3

var jumped: bool = false
var dash_ability: bool = true
var is_dashing: bool = false
var boat_unlocked: bool = false

var x_movement: float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	x_movement = Input.get_axis("swim_left", "swim_right")
	
func get_jump_input() -> bool:
	return Input.is_action_just_pressed("jump")

func swim_handle(body: CharacterBody2D, delta: float) -> void:
	body.velocity.x = swim_speed * delta
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
		
func swimup_handle(body: CharacterBody2D, jump_delta: float) -> void:
	if jump_delta != 0:
		body.velocity.y = jump_velocity
	
	jumped = body.velocity.y < 0

func boat_handle(body: CharacterBody2D, delta: float) -> void:
	if boat_unlocked == true:
		body.velocity.x = boat_speed * delta
