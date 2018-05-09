extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocidad = Vector2(1, 0.5)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
    position += velocidad * delta * 200
    if position.x > 800 or position.x < 0: 
        velocidad.x = - velocidad.x
    if position.y > 600 or position.y < 0: 
        velocidad.y = - velocidad.y
