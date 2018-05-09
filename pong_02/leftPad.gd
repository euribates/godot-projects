extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    pass

func _process(delta):
    if Input.is_action_pressed('left_player_up'):
         position.y -= delta * 100
    if Input.is_action_pressed('left_player_down'):
        position.y += delta * 100