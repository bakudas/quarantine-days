extends Spatial
class_name Item

signal tipo_item(tipo)


var item : Dictionary = {
	id = 00,
	"tipo": "",
	"usos": 0,
}


func _ready():
	print(item)


func _atualiza_item_pick_up() -> void:
	Gm.item.tipo = item.tipo
	Gm.item.usos = item.usos
	pass

func _retira_da_cena() -> void:
	queue_free()
