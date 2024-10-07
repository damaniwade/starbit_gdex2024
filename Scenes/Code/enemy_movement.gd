class_name Enemy_Move_Handle
extends Node

@export_subgroup("ControlVariables")
@export var speed: float = 5000.0


var x_movement: Vector2 = Vector2.LEFT



func movement_handle(body: CharacterBody2D, delta: float) -> void:
	body.velocity.x = x_movement.x * speed * delta
