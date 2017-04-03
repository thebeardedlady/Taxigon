const tau = 8.0

static func trotate(center, pos, angle):
	var point = pos - center
	var radius = tdist(Vector2(0,0), point)
	var theta = tarctan(point.x,point.y)
	theta = tau_wrap(theta + angle)
	point = Vector2(tcos(theta),tsin(theta)) * radius
	return point + center


static func tau_wrap(angle):
	if(angle < 0.0):
		return tau - fmod(-angle,tau)
	else:
		return fmod(angle, tau)

static func tdist(pos0,pos1):
	return abs(pos0.x - pos1.x) + abs(pos0.y - pos1.y)

static func tarctan(x,y):
	if(x == 0.0):
		if(y > 0.0):
			return 2.0
		elif(y < 0.0):
			return 6.0
		else:
			return 0.0
	else:
		var slope = y/x
	#	breakpoint
		if(slope > 0.0):
			var px = 1.0 / (1.0 + slope)
#			breakpoint
			var dist = tdist(Vector2(px,1-px),Vector2(1,0))
#			breakpoint
			if(x > 0.0 and y > 0.0):
				return dist
			else:
				return dist + 4.0
		elif(slope < 0.0):
			var px = 1.0 / (1.0 - slope)
#			breakpoint
			var dist = tdist(Vector2(px,px - 1),Vector2(1,0))
#			breakpoint
			if(x > 0.0 and y < 0.0):
				return tau - dist
			else:
				return 4.0 - dist
		else:
			if(x > 0.0):
				return 0.0
			elif(x < 0.0):
				return 4.0
			else:
				return 0.0


static func tsin(angle):
	if(angle >= 0.0 and angle < 2.0):
		return angle * 0.5
	elif(angle >= 2.0 and angle < 6.0):
		return 2.0 - 0.5 * angle
	else:
		return -4.0 + 0.5 * angle

static func tcos(angle):
	if(angle >= 0.0 and angle < 4.0):
		return 1.0 - 0.5 * angle
	else:
		return -3.0 + 0.5 * angle