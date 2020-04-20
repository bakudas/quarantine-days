extends Spatial

signal is_completed


func _physics_process(delta):
	var action = Input.is_action_just_pressed("action")
	
	if action:
		grow()


func grow() -> void:
	#TODO 
	# Arrumar essa função
	$animator.play("grow_01")


func completed() -> void:
	#TODO
	# função para completar a plantar
	fx_completed()
	emit_signal("is_completed")


func show_progress() -> void:
	#TODO
	# mostrar a barra de progresso
	pass

func fx_sede() -> void:
	#TODO
	# feedback visual para planta com sede
	pass


func fx_molhada() -> void:
	#TODO
	# feedback visual para planta que acabou de ser regada
	pass
	
	
func fx_completed() -> void:
	#TODO
	# animação e FX de completar a planta
	pass
