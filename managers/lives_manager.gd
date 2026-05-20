class_name LivesManager
extends Node


var player_lives: int = 4 :
	set(new_value):
		player_lives = new_value;
		EventBus.player_lives_changed.emit(player_lives);


func _ready() -> void:
	EventBus.enemy_reached_bottom.connect(_on_enemy_reached_bottom);


func lose_life() -> void:
	player_lives -= 1;


func _on_enemy_reached_bottom() -> void:
	lose_life();
	print("LIFE LOSSED!");
