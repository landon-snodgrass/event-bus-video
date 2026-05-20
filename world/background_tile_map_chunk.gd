class_name BackgroundTileMapChunk
extends TileMapLayer


signal chunk_scrolled_off_screen;


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if global_position.y >= 180:
		chunk_scrolled_off_screen.emit();
