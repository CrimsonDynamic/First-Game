extends Area2D

@onready var ui = %UI
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	ui.add_point()
	animation_player.play("pickup")
