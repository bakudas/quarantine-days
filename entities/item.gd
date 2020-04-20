extends Spatial
class_name Item

signal tipo_item(tipo)


var item : Dictionary = {
	"tipo": "",
	"usos": 0,
}


func _ready():
	print(item)


func _atualiza_item_pick_up() -> void:
	Gm.item.tipo = item.tipo
	Gm.item.usos = item.usos
	pass


