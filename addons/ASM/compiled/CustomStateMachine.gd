class_name CustomStateMachine


var state_machine:StateMachine = StateMachine.new(self)

enum STATE {IDLE, ATTACK, JUMP, HIT, RUN, DASH}

func _ready():
	state_machine.register_state(STATE.IDLE,"idle",false,false)
	state_machine.register_state(STATE.ATTACK,"attack",false,false)
	state_machine.register_state(STATE.JUMP,"jump",false,false)
	state_machine.register_state(STATE.HIT,"hit",false,false)
	state_machine.register_state(STATE.RUN,"run",false,false)
	state_machine.register_state(STATE.DASH,"dash",false,false)
	state_machine.change_state(STATE.IDLE)

func _process(_delta):
	state_machine.machine_update()




func st_update_idle():
	state_machine.change_state(STATE.RUN)
	pass

func st_update_attack():
	state_machine.change_state(STATE.IDLE)
	pass

func st_update_jump():
	state_machine.change_state(STATE.IDLE)
	pass

func st_update_hit():
	state_machine.change_state(STATE.IDLE)
	pass

func st_update_run():
	state_machine.change_state(STATE.IDLE)
	pass

func st_update_dash():
	state_machine.change_state(STATE.HIT)
	pass
