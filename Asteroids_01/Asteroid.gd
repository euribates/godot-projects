extends KinematicBody2D

export (Vector2) var direction
export (int) var speed

var screen_size = Vector2()

    
func _ready():
    screen_size = get_viewport_rect().size
    position = screen_size / 2
    print('screen_size:', screen_size)
    print('position.', position)
    
func _process(delta):
    move_and_collide(direction * speed * delta)