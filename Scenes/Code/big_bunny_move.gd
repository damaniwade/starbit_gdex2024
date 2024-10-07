extends CharacterBody2D

@export var gravity_control: Ground_Gravity_Handle
@export var move_control: Enemy_Move_Handle
@export var anim_control: Enemy_Animation_Handle
@export var end_points: Node
@onready var health = get_node("HP")

var point_amount: int
var point_pos: Array[Vector2]
var current_point: Vector2
var current_point_pos: int

func _ready():
	if end_points != null:
		point_amount = end_points.get_children().size()
		for point in end_points.get_children():
			point_pos.append(point.global_position)
		current_point = point_pos[current_point_pos]

func _physics_process(delta: float) -> void:
	gravity_control.handle_gravity(self, delta)
	if abs(position.x - current_point.x) > 0.5:
		move_control.movement_handle(self, delta)
	else:
		current_point_pos += 1
		if current_point_pos > 1:
			current_point_pos -= 2
	
	current_point = point_pos[current_point_pos]
	
	if current_point.x > position.x:
		move_control.x_movement = Vector2.RIGHT
	else:
		move_control.x_movement = Vector2.LEFT
	
	anim_control.move_animation(velocity.x)
	
	if self.health.HP <= 0:
		self.queue_free()
	
	
	move_and_slide()
