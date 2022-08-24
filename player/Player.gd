extends KinematicBody2D

export var walkSpeed = 4.0
const TILE_SIZE = 16

onready var animTree = $AnimationTree
onready var animState = animTree.get("parameters/playback")

var iniPos = Vector2.ZERO
var inputDir = Vector2.ZERO
var isMoving = false
var percentMovedToNextTile = 0.0

enum PLAYER_STATE {IDLE, TURNING, WALKING}
enum PLAYER_DIR {LEFT, RIGHT, UP, DOWN}

var playerState = PLAYER_STATE.IDLE
var playerDir = PLAYER_DIR.DOWN

# Called when the node enters the scene tree for the first time.
func _ready():
	animTree.set("active", true)
	iniPos = position

func _physics_process(delta):
	if playerState == PLAYER_STATE.TURNING:
		return
	elif isMoving == false:
		processPlayerInput()
	elif inputDir != Vector2.ZERO:
		animState.travel("Walk")
		move(delta)
	else:
		animState.travel("Idle")
		isMoving = false

func processPlayerInput():
	if inputDir.y == 0:
		inputDir.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if inputDir.x == 0:
		inputDir.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	if inputDir != Vector2.ZERO:
		animTree.set("parameters/Idle/blend_position", inputDir)
		animTree.set("parameters/Walk/blend_position", inputDir)
		animTree.set("parameters/Turn/blend_position", inputDir)
		
		if needToTurn():
			playerState = PLAYER_STATE.TURNING
			animState.travel("Turn")
		else:
			iniPos = position
			isMoving = true
	else:
		animState.travel("Idle")

func move(delta):
	percentMovedToNextTile += walkSpeed * delta
	if percentMovedToNextTile >= 1.0:
		position = iniPos + (TILE_SIZE * inputDir)
		percentMovedToNextTile = 0.0
		isMoving = false
	else:
		position = iniPos + (TILE_SIZE * inputDir * percentMovedToNextTile)

func finishedTurning():
	playerState = PLAYER_STATE.IDLE

func needToTurn():
	var newFacingDir
	if inputDir.x < 0:
		newFacingDir = PLAYER_DIR.LEFT
	elif inputDir.x > 0:
		newFacingDir = PLAYER_DIR.RIGHT
	elif inputDir.y < 0:
		newFacingDir = PLAYER_DIR.UP
	elif inputDir.y > 0:
		newFacingDir = PLAYER_DIR.DOWN
	
	if playerDir != newFacingDir:
		playerDir = newFacingDir
		return true
	else:
		playerDir = newFacingDir
		return false
