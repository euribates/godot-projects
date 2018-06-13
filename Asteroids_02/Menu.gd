extends MarginContainer

var tree

func _ready():
    tree = get_tree()


func _on_OpenShip_pressed():
    tree.change_scene('res://Ship.tscn')


func _on_OpenMain_pressed():
    tree.change_scene('res://Main.tscn')


func _on_OpenAsteroid_pressed():
    tree.change_scene('res://Asteroid.tscn')
