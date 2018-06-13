extends KinematicBody2D

signal fire

var orientation = Vector2(1, 0)
var impulse = Vector2(0, 0)
var speed = 0
var rotation_speed = 0.1
var acc = .25
var screen_size = Vector2()
var engine_on = false

func _ready():
    screen_size = get_viewport_rect().size
    position = screen_size / 2    

func _process(delta):
    if engine_on:
        speed += acc
        impulse += orientation * speed * delta
    move_and_collide(impulse * speed * delta)
    if position.x > screen_size.x:
        position.x = 0
    elif position.x < 0:
        position.x = screen_size.x
    if position.y > screen_size.y:
        position.y = 0
    elif position.y < 0:
        position.y = screen_size.y
    
func rotate_left():
    orientation = orientation.rotated(-rotation_speed)
    rotate(-rotation_speed)
    
func rotate_right():
    orientation = orientation.rotated(rotation_speed)
    rotate(rotation_speed)

func speed_up():
    engine_on = true
    $Sprite.frame = 1
    
func brake():
    engine_on = false
    acc = 0
    $Sprite.frame = 0
    
func teleport():
    var x = rand_range(0, screen_size.x)
    var y = rand_range(0, screen_size.y)
    position = Vector2(x, y)

func _input(event):
    if event.is_action('ui_left'):
        rotate_left()        
    elif event.is_action('ui_right'):
        rotate_right()
    elif event.is_action('ui_accept'):
        emit_signal("fire", $Sight.global_position, orientation)
    elif event.is_action_released('teleport'):
        teleport()
    elif event.is_action_pressed('ui_up'):
        speed_up()
    elif event.is_action_released('ui_up'):
        brake()