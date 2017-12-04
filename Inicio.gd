extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var style = StyleBoxFlat.new()

var gameData = {}
var savegame = File.new()

func _ready():
	add_style_override("panel",style)
	set_process(true)
	
	# faz load de dados, caso o load nao tenha sido feito
	if global.arquivoSalvarDados == null:
		global.carregar_dados()
	
func _process(delta):
	var color = Color(256,256,256)
	style.set_bg_color(color)
	update()

func _on_ProfessorBotao_pressed():
	get_tree().change_scene("res://Config01.tscn")
