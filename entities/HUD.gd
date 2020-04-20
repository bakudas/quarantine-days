extends Control


signal add_item

var watering_can_tex : String = "res://src/textures/UI/ui_watering_can.png"
var gardening_tools_tex : String = "res://src/textures/UI/ui_tools.png"


func _input(event):
	var action = Input.is_action_just_pressed("action")
	
	#FIXME
	# arrumar essa ação 
	if action:
		
		$pickup_item.visible = false
		$UI_confirma_item.visible = true

		match Gm.item.tipo:
			"regador":
				$UI_confirma_item.texture = load(watering_can_tex)
				pass
				
			"tools":
				$UI_confirma_item.texture = load(gardening_tools_tex)
				pass
				
			#TODO
			# verificar quando ouver frutas
			"frutas":
				pass

func _on_Player_estou_vendo_item():
	$pickup_item.visible = true


func _on_Player_nao_estou_vendo_item():
	$pickup_item.visible = false
