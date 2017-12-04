extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var style = StyleBoxFlat.new()

func _ready():
	add_style_override("panel",style)
	set_process(true)
	
	get_node("Nome").set_text(global.alunoEscolhidoProfessor.nome)
	get_node("Pontuacao").set_text(str(global.alunoEscolhidoProfessor.pontuacao))
	get_node("TabRelatorios/RelatorioAcoesGerais").set_name("Relatório de ações gerais")
	get_node("TabRelatorios/RelatorioAcoesCenario").set_name("Relatório de ações do cenário")
	
func _process(delta):
	var color = Color(256,256,256)
	style.set_bg_color(color)
	update()