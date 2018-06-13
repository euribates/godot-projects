extends Node2D

var Bullet = load("res://Bullet.tscn")

func _on_Ship_fire(pos, direction):
    var bullet = Bullet.instance()
    add_child(bullet)
    bullet.fire(pos, direction)
    
