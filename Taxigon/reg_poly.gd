extends "res://taxicab.gd"

var radius = 0.0
var vertices = Vector2Array()

func _init(num,length):
	for i in range(num):
		var point = Vector2(tcos(i * tau/num),tsin(i * tau/num))
		point *= length
		vertices.append(point)

func trotate_poly(point,angle):
	for i in range(vertices.size()):
		vertices.set(i, trotate(point,vertices[i],angle))
