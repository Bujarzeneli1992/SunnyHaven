extends Node2D

@export var columns: int = 8
@export var rows: int = 8
@export var tile_size: Vector2 = Vector2(64, 64)
@export var tile_spacing: float = 4.0

func _ready() -> void:
	build_placeholder_grid()

func build_placeholder_grid() -> void:
	for child in get_children():
		child.queue_free()

	for row in rows:
		for column in columns:
			var tile := ColorRect.new()
			tile.size = tile_size
			tile.color = _placeholder_color(column, row)
			tile.position = Vector2(
				column * (tile_size.x + tile_spacing),
				row * (tile_size.y + tile_spacing)
			)
			add_child(tile)

func _placeholder_color(column: int, row: int) -> Color:
	var palette := [
		Color(0.98, 0.77, 0.47),
		Color(0.98, 0.56, 0.49),
		Color(0.52, 0.80, 0.95),
		Color(0.63, 0.89, 0.60),
		Color(0.95, 0.92, 0.62)
	]
	return palette[(column + row) % palette.size()]
