extends Node2D

var direction = Vector2(1, 0)
var speed = 200

func fire(pos, dir):
    position = pos
    direction = dir
    $TimeOut.start()
    
func _process(delta):
    position += direction * speed * delta

func _on_TimeOut_timeout():
    queue_free()