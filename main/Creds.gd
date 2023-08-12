extends "res://main/Vault.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var password
# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Label4.text = password


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func editPassMode():
	$HBoxContainer/Button3.hide()
	$HBoxContainer/Label4.show()
	$HBoxContainer/Label3.hide()
	$HBoxContainer/Label4.grab_focus()
	
func _on_Labeled_focus_exited():
	passChange()

func passChange():
	
	$HBoxContainer/Button3.show()
	$HBoxContainer/Label4.hide()
	$HBoxContainer/Label3.show()

	Globals.change_pass(identifier,$HBoxContainer/Label4.text)





func _on_Button3es_pressed():
	editPassMode()
	


func _on_Labeled_text_entered(new_text):
	passChange()
