extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var label = "Vault"

# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Label.text = label


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
