extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var label = "Vault"
var identifier = 0
var credential = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Label.text = label
	$HBoxContainer/Label2.text = label
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_toggled(button_pressed):
	if $HBoxContainer/Button.text=="▼":
		expand()
	else:
		collapse()


func expand():
	
	$HBoxContainer/Button.text="▲"
	$VBoxContainer.show()
	
	var folders = Globals.get_folders(identifier)
	for i in folders:
		var object_type = Globals.PRE_FOLDER.instance() if not i.password else Globals.PRE_CREDENTIAL.instance()
		var folder_instance = object_type
		folder_instance.label = i.name
		folder_instance.identifier = i.id
		if i.password:
			folder_instance.credential = true
			folder_instance.password = i.password
		$VBoxContainer/HBoxContainer2/VBoxContainer2/VBoxContainer.add_child(folder_instance)

func collapse():
	if !credential:
		$HBoxContainer/Button.text="▼"
		$VBoxContainer.hide()
		for i in $VBoxContainer/HBoxContainer2/VBoxContainer2/VBoxContainer.get_children():
			i.queue_free()


func _on_Button2_pressed():
	
	Globals.add_folder(identifier)
	if !credential:
		if $HBoxContainer/Button5.pressed:
			collapse()
			expand()
		else:
			$HBoxContainer/Button5.pressed = true
		
	else:
		collapse()
		expand()
	
	
	



func _on_Button4_pressed():
	$HBoxContainer/confirmation.show()
	$HBoxContainer/confirmation.grab_focus()
	

func delete_directory():
	Globals.delete_folder(identifier)
	if !credential:
		for i in $VBoxContainer/HBoxContainer2/VBoxContainer2/VBoxContainer.get_children():
			i.delete_directory()


func _on_Button_pressed():
	editNameMode()

func editNameMode():
	$HBoxContainer/Button2.hide()
	$HBoxContainer/Label.show()
	$HBoxContainer/Label2.hide()
	$HBoxContainer/Label.grab_focus()
	
func _on_Label_focus_exited():
	nameChange()

func nameChange():
	
	$HBoxContainer/Button2.show()
	$HBoxContainer/Label.hide()
	$HBoxContainer/Label2.show()

	Globals.change_name(identifier,$HBoxContainer/Label.text)


func _on_Label_text_changed(new_text):
	$HBoxContainer/Label2.text=new_text


func _on_Label_text_entered(new_text):
	nameChange()


func _on_Button3_pressed():
	Globals.add_cred(identifier)
	if $HBoxContainer/Button.text!="▼":
		collapse()
		expand()
	else:
		$HBoxContainer/Button5.pressed = true
		expand()
		

func close_confirmation():
	$HBoxContainer/confirmation.hide()



func _on_yes_pressed():
	delete_directory()
	queue_free()


func _on_confirmation_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			close_confirmation()
