extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var label = "Vault"
var identifier = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Label.text = label


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_toggled(button_pressed):
	if button_pressed:
		expand()
	else:
		collapse()


func expand():
	$HBoxContainer/Button.text="▲"
	$VBoxContainer.show()
	
	var folders = Globals.get_folders(identifier)
	for i in folders:
		var folder_instance = Globals.PRE_FOLDER.instance()
		folder_instance.label = i.name
		folder_instance.identifier = i.id
		$VBoxContainer/HBoxContainer2/VBoxContainer2/VBoxContainer.add_child(folder_instance)

func collapse():
	$HBoxContainer/Button.text="▼"
	$VBoxContainer.hide()
	for i in $VBoxContainer/HBoxContainer2/VBoxContainer2/VBoxContainer.get_children():
		i.queue_free()
