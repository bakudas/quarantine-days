extends KinematicBody

export var Sensitivity_X : float = 0.1
export var Sensitivity_Y : float = 0.1
export var Invert_Y_Axis : bool = false
export var Exit_On_Escape : bool = true
export var Maximum_Y_Look : int = 45
export var Accelaration : int = 5
export var Maximum_Walk_Speed : int = 10
export var Jump_Speed : int = 2

const GRAVITY : float = 0.098
var velocity : Vector3 = Vector3(0,0,0)
var forward_velocity : float = 0
var Walk_Speed : float = 0
var temp_item
var item_active 
var planta_active : bool = false
var planta_child_count = 1

onready var popup_item : Node = get_node("../PopupPanel")
onready var regador : Node = get_node("Camera/regador")
onready var fx_agua : Node = get_node("Camera/regador/fx_agua")
onready var _fx_agua_up : PackedScene = preload("res://entities/fx_water_up.tscn")


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	forward_velocity = Walk_Speed
	set_process(true)
	popup_item.hide()
	

func _process(delta) -> void:
	if Exit_On_Escape:
		if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()
			


func _physics_process(delta) -> void:
	velocity.y -= GRAVITY
	
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
		Walk_Speed += Accelaration
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = -global_transform.basis.z.x * Walk_Speed
		velocity.z = -global_transform.basis.z.z * Walk_Speed
	if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
		Walk_Speed += Accelaration
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = global_transform.basis.z.x * Walk_Speed
		velocity.z = global_transform.basis.z.z * Walk_Speed
	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		Walk_Speed += Accelaration
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = -global_transform.basis.x.x * Walk_Speed
		velocity.z = -global_transform.basis.x.z * Walk_Speed
		
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		Walk_Speed += Accelaration
		if Walk_Speed > Maximum_Walk_Speed:
			Walk_Speed = Maximum_Walk_Speed
		velocity.x = global_transform.basis.x.x * Walk_Speed
		velocity.z = global_transform.basis.x.z * Walk_Speed
		
	if not(Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_DOWN) or Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_RIGHT)):
		velocity.x = 0
		velocity.z = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = Jump_Speed
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))


func _input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(-Sensitivity_X * event.relative.x)
	
	if Input.is_key_pressed(KEY_E) and popup_item.is_visible_in_tree():
		popup_item.hide()
		regador.visible = true
		temp_item.queue_free()
		item_active = temp_item.name
		temp_item = null

	if item_active == "regador" and Input.is_action_pressed("action"):
		fx_agua.visible = true
		
		if planta_active:
			temp_item.get_child(planta_child_count).visible = true
			planta_child_count += 1
			print(planta_child_count)
			fx_water_up()
	else:
		fx_agua.visible = false
		

func _on_trigger_area_entered(area):
	temp_item = area.get_parent()
	print(temp_item.name)
	
	if area.is_in_group("item") and temp_item.is_visible_in_tree():
		popup_item.popup()
		
	if area.is_in_group("prantinha"):
		planta_active = true
		temp_item = area.get_parent()
		print(area.get_parent().name + "AHsDAHSDAHS")
		


func _on_trigger_area_exited(area):
	planta_active = false
	popup_item.hide()
	
func fx_water_up() -> void:
	var fx_agua_up = _fx_agua_up.instance()
	fx_agua_up.translation = temp_item.translation
	add_child(fx_agua_up)

