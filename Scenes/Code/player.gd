extends CharacterBody2D

@export var grounded_gravity_control: Ground_Gravity_Handle
@export var grounded_input_control: Ground_Input_Handle
@export var animation_control: Animation_Handle
@export var swimming_gravity_control: Swim_Gravity_Handle
@export var swimming_input_control: Swim_Input_Handle
@export var arrow_scene: PackedScene
@onready var health = get_node("HPNode")

var is_underwater: bool = false
var timer
var time = 6
var currentTime
var overlapping: bool = false

func get_input():
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta: float) -> void:
	get_input()
	$HPLabel.set_text(str(health.HP))
	if self.is_underwater == false:
		grounded_gravity_control.handle_gravity(self, delta)
		grounded_input_control.movement_handle(self, grounded_input_control.x_movement)
		if self.is_on_floor():
			grounded_input_control.jump_handle(self, grounded_input_control.get_jump_input())
		else:pass
		animation_control.move_animation(grounded_input_control.x_movement)
		animation_control.jump_animation(grounded_input_control.jumped, grounded_gravity_control.is_falling)
		animation_control.dash_animation(grounded_input_control.is_dashing)
	
	elif self.is_underwater == true:
		swimming_gravity_control.handle_gravity(self, delta)
		swimming_input_control.swim_handle(self, swimming_input_control.x_movement)
		swimming_input_control.swimup_handle(self, swimming_input_control.get_jump_input())
		swimming_input_control.boat_handle(self, swimming_input_control.x_movement)
		
	if self.health.HP <= 0:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D):
	if body == self:
		self.is_underwater = true
		$PurpleParticles.emitting = true
		$PinkParticles.emitting = true
		$BlueParticles.emitting = true
func _on_area_2d_body_exited(body: Node2D):
	if body == self:
		self.is_underwater = false
		$PurpleParticles.emitting = true
		$PinkParticles.emitting = true
		$BlueParticles.emitting = true

func _on_moon_beam_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		overlapping = true
		currentTime = time - 1
		for i in time:
			if overlapping == true:
				await(get_tree().create_timer(1)).timeout
				$Label.set_text(str(currentTime))
				currentTime -= 1
			else:
				$Label.set_text(str(""))
		await(get_tree().create_timer(1)).timeout
		$Label.set_text(str(""))
		
		if overlapping == true:
			health.HP -= 2

func _on_moon_beam_hit_box_body_exited(body):
	if body.is_in_group("Player"):
		overlapping = false
		$Label.set_text(str(""))
		
func shoot():
	var b = arrow_scene.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
