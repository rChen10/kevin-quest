extends TileMap

var tile_size = get_cell_size()
var half_tile = tile_size / 2
var grid_size = Vector2(64, 64)
var grid = []

enum ENTITY_TYPES {PLAYER, OBSTACLE, INTERACT}

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)

func is_cell_vacant():
	
	pass
	
	
func update_child_pos(child, new_pos, direction):
	
	pass
