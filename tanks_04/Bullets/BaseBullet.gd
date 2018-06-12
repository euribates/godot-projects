extends Area2D

export (int) var speed = 100
export (int) var damage = 10
export (float) var lifetime = 0.5

var velocity = Vector2()

func start(_pos, _dir):
    position = _pos
    rotation = _dir.angle()
    $LifeTime.wait_time = lifetime
    $LifeTime.start()
    velocity = _dir * speed
    
func _process(delta):
    print($Lifetime)
    position += velocity * delta
    
func explode():
     queue_free()

func _on_Bullet_body_entered(body):
    explode()
    if body.has_method('take_damage'):
        body.take_damage(damage)

func _on_LifeTime_timeout():
    print('timeout')
    explode()
