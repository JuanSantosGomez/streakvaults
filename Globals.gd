extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DB/db"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_folders(id=null):
	if !id:
		db.query(
			"""SELECT * 
				FROM folders_folder 
				WHERE id is null
				;
			"""
		)
	else:
		db.query(
			"""SELECT * 
				FROM folders_folder 
				WHERE id = """+str(id)+"""
				;
			"""
		)
	return db.query_result
