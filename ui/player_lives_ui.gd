class_name PlayerLivesUi
extends Control


@export var life_icon_scene: PackedScene

@onready var lives_container: HBoxContainer = $LivesContainer


func _ready() -> void:
	EventBus.player_lives_changed.connect(set_player_lives);


func set_player_lives(new_lives_amount: int) -> void:
	for child in lives_container.get_children():
		child.queue_free();

	for life in new_lives_amount:
		var life_icon = life_icon_scene.instantiate();
		lives_container.add_child(life_icon);
