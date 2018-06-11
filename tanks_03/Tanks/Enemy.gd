extends "res://Tanks/Tank.gd"

onready var parent = get_parent()

export (float) var turret_speed = 3
export (float) var detect_radius

var target = null

#func _ready():
#    $Detector/CollisionShape2D.shape.radius = 100.5

func control(delta):
    if parent is PathFollow2D:
        parent.set_offset(parent.get_offset() + speed * delta)
    
func _process(delta):
    if target:
        var target_dir = (target.global_position - global_position).normalized()
        var current_dir = Vector2(1, 0).rotated($Turret.global_rotation)
        print(target_dir)
        print(turret_speed)
        $Turret.global_rotation = current_dir.linear_interpolate(target_dir, turret_speed*delta).angle()

func _on_Detector_body_entered(body):
    print('_on_Detector_body_entered')
    print('body.name', body.name)
    if body.name == 'Player':
        print('target:', body)
        target = body

func _on_Detector_body_exited(body):
    print('_on_Detector_body_exited')
    print('body.name', body.name)
    if body.name == 'Player':
        target = null
