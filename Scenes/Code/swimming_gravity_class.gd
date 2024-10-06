class_name Swim_Gravity_Handle
extends Node

@export_subgroup("ControlVariables")
@export var gravity: float = 400.0

var is_falling: bool = false

func handle_gravity(body: CharacterBody2D, delta: float) -> void:
	if !body.is_on_floor() and body.velocity.y < 300:
		body.velocity.y += gravity * delta
		
	is_falling = body.velocity.y > 0 and not body.is_on_floor()
