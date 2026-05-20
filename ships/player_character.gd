extends CharacterBody2D


const MAX_HORIZONTAL_SPEED = 200.0;
const HORIZONTAL_ACCELERATION = 0.08;

const MAX_FORWARD_SPEED = 50.0;
const FORWARD_ACCELERATION = 0.02;

const MAX_BACKWARD_SPEED = 100.0;
const BACKWARD_ACCELERATION = 0.05;

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@export var bullet_scene: PackedScene


@onready var bullet_timer: Timer = $BulletTimer
@onready var marker_2d: Marker2D = $Marker2D
@onready var marker_2d_2: Marker2D = $Marker2D2


func _physics_process(_delta: float) -> void:
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");

	velocity.x = lerp(velocity.x, input_vector.x * MAX_HORIZONTAL_SPEED, HORIZONTAL_ACCELERATION);

	if input_vector.y < 0:
		velocity.y = lerp(velocity.y, input_vector.y * MAX_FORWARD_SPEED, FORWARD_ACCELERATION);
	else:
		velocity.y = lerp(velocity.y, input_vector.y * MAX_BACKWARD_SPEED, BACKWARD_ACCELERATION);

	move_and_slide();


func fire_bullet() -> void:
	var bullet1: Bullet = bullet_scene.instantiate();
	var bullet2: Bullet = bullet_scene.instantiate();
	bullet1.global_position = marker_2d.global_position;
	bullet2.global_position = marker_2d_2.global_position;
	get_parent().add_child(bullet1);
	get_parent().add_child(bullet2);


func _on_bullet_timer_timeout() -> void:
	fire_bullet();
	bullet_timer.start();
