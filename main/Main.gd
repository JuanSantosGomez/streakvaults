extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	displayFolders()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func displayFolders():
	var folders = Globals.get_folders()
	for i in folders:
		var folder_instance = Globals.PRE_FOLDER.instance()
		folder_instance.label = i.name
		folder_instance.identifier = i.id
		$ScrollContainer/VBoxContainer2.add_child(folder_instance)
func clearFolders():
	for i in $ScrollContainer/VBoxContainer2.get_children():
		if i.name!='HBoxContainer':
			i.queue_free()




func _on_Button_pressed():
	Globals.add_folder()
	clearFolders()
	displayFolders()
