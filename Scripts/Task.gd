extends Node

var tasks = []
var rng = RandomNumberGenerator.new()
var current_task

func _ready():
	load_tasks("res://data/tasks.json") 

func load_tasks(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	
	if file:
		var content = file.get_as_text()
		var result = JSON.parse_string(content)
		
		if result is Array:
			tasks = result
			print("Loaded tasks: ", tasks)
		else:
			push_error("Error parsing JSON: Not an array.")
			
		file.close()
	else:
		push_error("Failed to open file: " + path)

func openTask():
	rng.randomize()
	var index = rng.randf_range(0, len(tasks)-1)
	current_task = tasks[index]
	if current_task.has("prompt"):
		$VBoxContainer/TaskLabel.text = current_task.get("prompt")
	else:
		push_error("Tasks data seems to be corrupt: prompt missing for ", current_task)
	if current_task.has("option_a"):
		$VBoxContainer/HBoxContainer/AButton.text = current_task.get("option_a")
	else:
		push_error("Tasks data seems to be corrupt: option_a missing for ", current_task)
	if current_task.has("option_b"):
		$VBoxContainer/HBoxContainer/BButton.text = current_task.get("option_b")
	else:
		push_error("Tasks data seems to be corrupt: option_b missing for ", current_task)
	
	
