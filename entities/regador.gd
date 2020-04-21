extends Item


func _init():
	item.id = rand_range(0, 1000)
	item.tipo = "regador"
	item.usos = 20
