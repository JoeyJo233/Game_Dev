extends Node

var score = 0 
@onready var score_label: Label = $scoreLabel


func add_point():
	score += 1
	
	score_label.text = "you collected " + str(score) + "coins"
	print(score)
