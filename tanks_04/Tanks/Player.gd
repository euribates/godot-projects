extends "res://Tanks/Tank.gd"

func _input(event):
    if event.is_action_pressed("zoom_in"):
        $Camera2D.zoom *= 2 
    if event.is_action_pressed("zoom_out"):
        $Camera2D.zoom *= .5 

func control(delta):
    $Turret.look_at(get_global_mouse_position())
    var rot_dir = 0
    if Input.is_action_pressed('turn_right'):
        rot_dir += 1
    if Input.is_action_pressed("turn_left"):
        rot_dir -= 1
    rotation += rotation_speed * rot_dir * delta
    velocity = Vector2()
    if Input.is_action_pressed("forward"):
        velocity = Vector2(speed, 0).rotated(rotation)
    if Input.is_action_pressed("backward"):
        velocity = Vector2(-speed/2, 0).rotated(rotation)
    if Input.is_action_just_pressed('click'):
        shoot()
    if Input.is_action_just_pressed('zoom_in'):
        $Camera2D.zoom *= 2 
    if Input.is_action_just_pressed('zoom_out'):
        $Camera2D.zoom *= 0.5