extends Node2D

func _ready():
    $Superman/AnimationPlayer.get_animation("Idle").set_loop(true)
    $Superman/AnimationPlayer.play('Idle')
    $Horse/AnimationPlayer.get_animation("Galope").set_loop(true)
    $Horse/AnimationPlayer.play('Galope')