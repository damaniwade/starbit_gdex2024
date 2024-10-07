extends Area2D

var overlapping: bool

func _ready():
	overlapping = false

func _on_body_entered(body):
	if body.is_in_group("Player"):
		overlapping = true
		body.health.HP -= 3
		for i in get_tree().get_nodes_in_group("PlayerCollider"):
			i.disabled = true
		
		for i in body.health.HP:
			await(get_tree().create_timer(1)).timeout
			redo_damage(body)
			for j in get_tree().get_nodes_in_group("PlayerCollider"):
				j.disabled = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		overlapping = false

func redo_damage(body):
	if body.is_in_group("Player"):
		for i in get_tree().get_nodes_in_group("PlayerCollider"):
			i.disabled = true
		
		if overlapping == true:
			body.health.HP -= 3
