class_name EnemyShip
extends Node2D


var speed: float = 75.0;
var direction: Vector2 = Vector2.DOWN;



func _physics_process(delta: float) -> void:
	global_position += speed * direction * delta;


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	EventBus.enemy_reached_bottom.emit();


func _on_hurtbox_area_entered(area: Area2D) -> void:
	var bullet = area.get_parent();
	if bullet is Bullet:
		bullet.queue_free()
	queue_free();
