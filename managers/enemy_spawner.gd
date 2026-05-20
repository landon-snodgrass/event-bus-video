extends Node


@export var enemy_scene: PackedScene;

@onready var timer: Timer = $Timer


func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate();
	enemy.global_position = Vector2(randf_range(16, 300), -16);
	get_parent().add_child(enemy);


func _on_timer_timeout() -> void:
	spawn_enemy()
	timer.start();
