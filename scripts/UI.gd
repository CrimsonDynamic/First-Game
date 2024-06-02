extends Node

var score = 0

@onready var score_label = %Score


func add_point():
	score += 1 
	update_score_label()

func update_score_label():
	score_label.text = "Coins: " + str(score)
