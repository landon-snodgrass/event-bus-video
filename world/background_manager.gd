class_name BackgroundManager
extends Node2D


var scroll_speed: float = 30.0;

@onready var chunks: Array[BackgroundTileMapChunk] = [
	$BackgroundTileMapChunk,
	$BackgroundTileMapChunk2,
	$BackgroundTileMapChunk3
]


func _ready() -> void:
	for chunk in chunks:
		chunk.chunk_scrolled_off_screen.connect(_on_chunk_scrolled_off_screen.bind(chunk));


func _physics_process(delta: float) -> void:
	for chunk in chunks:
		chunk.global_position.y += scroll_speed * delta;


func _on_chunk_scrolled_off_screen(chunk: BackgroundTileMapChunk) -> void:
	chunk.global_position.y = -360.0;
