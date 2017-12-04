extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var style = StyleBoxFlat.new()

var gameData = {}
var savegame = File.new()

func _load_data():
	global.arquivoSalvarDados = File.new()
	global.dadosJogo = {}
	if !global.arquivoSalvarDados.file_exists("dados.save"):
		global.arquivoSalvarDados.open("dados.save", File.WRITE)
		global.dadosJogo = {
			"alunos": []
		}
		global.arquivoSalvarDados.store_string(global.dadosJogo.to_json())
		global.arquivoSalvarDados.close()
	else:
		global.arquivoSalvarDados.open("dados.save", File.READ_WRITE)
		global.dadosJogo.parse_json(savegame.get_line())
	pass


func _ready():
	add_style_override("panel",style)
	set_process(true)
	
	# faz load de dados, caso o load nao tenha sido feito
	if global.arquivoSalvarDados == null:
		_load_data()
	
func _process(delta):
	var color = Color(256,256,256)
	style.set_bg_color(color)
	update()

func _on_ProfessorBotao_pressed():
	get_tree().change_scene("res://Config01.tscn")
