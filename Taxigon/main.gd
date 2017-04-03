
extends Node2D


var reg_poly = preload("res://reg_poly.gd")
var middle

func _ready():
	middle = reg_poly.new(6,100.0)
	set_process(true)

func _process(delta):
	middle.trotate_poly(Vector2(0,0),delta)
	update()

func _draw():
	draw_colored_polygon(middle.vertices, Color(1,1,1))
	draw_circle(Vector2(0,0),5,Color(0.5,0.75,1.0))