extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var style = StyleBoxFlat.new()

func _ready():
	add_style_override("panel",style)
	set_process(true)
	
func _process(delta):
	var color = Color(256,256,256)
	style.set_bg_color(color)
	update()

func _on_BotaoVoltar_pressed():
	get_tree().change_scene("res://Config01.tscn")

func retornaCadastroAluno(nome):
	for aluno in global.dadosJogo.alunos:
		if aluno.nome == nome:
			return aluno
	return null

func _on_BotaoSalvar_pressed():
	# buscar na lista de alunos se ja existe algum aluno cadastrado
	# com o nome do aluno que foi informado pelo professor
	var nomeAluno = get_node("InputNomeAluno").get_text()
	var aluno = retornaCadastroAluno(nomeAluno)
	
	if aluno == null:
		global.alunoEscolhidoProfessor = {"nome": nomeAluno, "pontuacao": 0, "acoes": []}
		global.dadosJogo.alunos.append(global.alunoEscolhidoProfessor)
		global.salvar_dados()
	else:
		global.alunoEscolhidoProfessor = aluno
		
	get_tree().change_scene("res://DadosAluno.tscn")