extends Control

signal remove_item_cena

var watering_can_tex : String = "res://src/textures/UI/ui_watering_can.png"
var gardening_tools_tex : String = "res://src/textures/UI/ui_tools.png"


func _input(event):
	var action = Input.is_action_just_pressed("action")
	var enter = Input.is_action_just_pressed("ui_accept")
	
	#FIXME
	# arrumar essa ação 
	if action and $pickup_item.is_visible_in_tree():
		
		$pickup_item.visible = false
		$UI_confirma_item.visible = true

		match Gm.item.tipo:
			#TODO 
			# terminar a ação da UI
			"regador":
				$UI_confirma_item.texture = load(watering_can_tex)
				Gm.item.tipo = "regador"
				Gm.item.ativo = true
				
			"tools":
				$UI_confirma_item.texture = load(gardening_tools_tex)
				Gm.item.tipo = "tools"
				Gm.item.ative = true
				pass
				
			#TODO
			# verificar quando ouver frutas
			"frutas":
				pass
				
	if enter and $UI_confirma_item.is_visible_in_tree():
		emit_signal("remove_item_cena")
		$UI_confirma_item.visible = false
		
		

func _on_Player_estou_vendo_item():
	$pickup_item.visible = true


func _on_Player_nao_estou_vendo_item():
	$pickup_item.visible = false
