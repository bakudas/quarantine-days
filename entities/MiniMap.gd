extends Control

onready var Target_XZ = get_parent().get_node("Player")
onready var Target_Y = get_parent().get_node("floor")

onready var cam = get_node("MapConteiner/MapViewport/Camera")

# warning-ignore:unused_argument
func _physics_process(delta):
	cam.translation.x = Target_XZ.get_global_transform().origin.x
	cam.translation.z = Target_XZ.get_global_transform().origin.z
	cam.translation.y = Target_Y.get_global_transform().origin.y + 40.0
