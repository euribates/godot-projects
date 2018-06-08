extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    # Called every time the node is added to the scene.
    # Initialization here
    pass

func _draw():
    var zero = Vector2()
    draw_line(zero, $Sprite.position, Color(255, 0 ,0), 1.0, true)
    
func _process(delta):
    $Sprite.position.x += 12 * delta
    $Sprite.rotation += 10 * delta
    if Input.is_action_just_pressed('ui_select'):
        $AnimationPlayer.play("Wooa")
    update()
