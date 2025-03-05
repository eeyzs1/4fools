extends CanvasLayer


@onready var hp_bar: ProgressBar = $Hp/HpBar
@onready var hp_val_label: Label = $Hp/HpBar/HpValLabel

@onready var exp_bar: ProgressBar = $EXP/ExpBar
@onready var exp_val_label: Label = $EXP/ExpBar/ExpValLabel

@onready var bounty_count: Label = $Bounty/BountyCount
@onready var lv_up_count: Label = $LvUpCount/LvUpCountLabel

@onready var timer: Timer = $Timer
@onready var timer_left: Label = $TimerLeft
@onready var sp_label = $SP/SpLabel
@onready var sp_bar = $SP/SpBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	timer_left.text = str(timer.time_left)

func start_timer(time:float) ->void:
	timer.start(time)

func _on_timer_timeout() -> void:
	if Controller.battle_start:
		Controller.battle_finished()
