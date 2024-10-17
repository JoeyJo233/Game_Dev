extends Node

@export var dialogConfig : dialogue_group = load("res://dialogicFile/dialogueTestGroup.tres")
var  timeline_list : Dictionary

func _ready() -> void:
	print("dff",Dialogic.Styles)
	#Dialogic.Styles.load_style()
	for item in dialogConfig.dialogue_list:
		var timeline = load(item.dialogTimeLine.resource_path as String)
		timeline_list[item.dialogId] = timeline
		Dialogic.preload_timeline(timeline)
	hide_dialog()

func get_dialog_timeline_by_id(id : int) -> Resource:
	for item in dialogConfig.dialogue_list:
		if item.dialogId == id:
			return item.dialogTimeLine
	return null

func get_dialog_timeline_path_by_id(id : int) -> String:
	var tempValue = get_dialog_timeline_by_id(id)
	if tempValue != null:
		return tempValue.resource_path
	return ""
	
func get_dialog_timeline_res_by_id(id : int):
	var tempValue = timeline_list[id]
	return tempValue
	
func start_dialog_by_id(id : int) -> void:
	var timeline = get_dialog_timeline_res_by_id(id)
	Dialogic.start(timeline)
	Dialogic.Styles.get_layout_node().show()
	
func hide_dialog() -> void:
	if Dialogic.Styles != null:
		var node = Dialogic.Styles.get_layout_node()
		if node != null:
			node.hide()
