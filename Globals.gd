extends Node

var PRE_FOLDER = preload("res://main/Vault.tscn")
var PRE_CREDENTIAL = preload("res://main/Creds.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DB/db"

# Called when the node enters the scene tree for the first time.
func _ready():
	db = SQLite.new()
	db.path = db_name
	db.open_db()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func change_name(id,new_name):
	db.query('UPDATE `folders_folder` SET `name` = "'+str(new_name)+'" WHERE `id` = '+str(id)+';')

func change_pass(id,new_pass):
	db.query('UPDATE `folders_folder` SET `password` = "'+str(new_pass)+'" WHERE `id` = '+str(id)+';')

func delete_folder(id):
	db.query("DELETE FROM folders_folder WHERE id = "+str(id)+";")

func get_folders(parent_id=null):
	if !parent_id:
		db.query(
			"""SELECT * 
				FROM folders_folder 
				WHERE parent is null
				ORDER BY password ASC, name ASC;
			"""
		)
	else:
		db.query(
			"""SELECT * 
				FROM folders_folder 
				WHERE parent = """+str(parent_id)+"""
				ORDER BY password ASC, name ASC;
			"""
		)
	print(db.query_result)
	return db.query_result

func add_folder(parent_id=null):
	if !parent_id:
		parent_id = "null"
	db.query(
			"""INSERT 
				INTO folders_folder 
				(name,parent)
				VALUES
				('new_cabinet',"""+str(parent_id)+""")
				;
			"""
		)

func add_cred(parent_id):
	db.query(
			"""INSERT 
				INTO folders_folder 
				(name,parent,password)
				VALUES
				('new_cabinet',"""+str(parent_id)+""",'12345')
				;
			"""
		)
