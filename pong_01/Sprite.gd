extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (Vector2) var velocidad

func _ready():
    velocidad = Vector2(1, -2).normalized()

func _process(delta):
    position += velocidad * delta * 200

func vertical_bounce(body):
    velocidad.y = - velocidad.y
