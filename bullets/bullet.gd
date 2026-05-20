class_name Bullet
extends Node2D


var speed: float = 300.0;
var direction: Vector2 = Vector2.UP;


func _physics_process(delta: float) -> void:
	global_position += speed * direction * delta;


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free();
