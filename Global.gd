extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# dados do aluno escolhido pelo professor, para visualizacao de dados
var alunoEscolhidoProfessor
# dados do aluno que esta jogando atualmente
var alunoJogando
# dados gerais do jogo que sao salvos e recuperados
var dadosJogo
# conexao com o arquivo que salva os dados do aluno
var arquivoSalvarDados

# salva dados do jogo
func salvar_dados():
	arquivoSalvarDados.open("dados.save", File.READ_WRITE)
	arquivoSalvarDados.store_string(dadosJogo.to_json())
	arquivoSalvarDados.close()
	
# carrega dados do jogo
func carregar_dados():
	arquivoSalvarDados = File.new()
	dadosJogo = {}
	if !arquivoSalvarDados.file_exists("dados.save"):
		arquivoSalvarDados.open("dados.save", File.WRITE)
		dadosJogo = {
			"alunos": []
		}
		arquivoSalvarDados.store_string(dadosJogo.to_json())
		arquivoSalvarDados.close()
	else:
		arquivoSalvarDados.open("dados.save", File.READ_WRITE)
		dadosJogo.parse_json(arquivoSalvarDados.get_line())
		arquivoSalvarDados.close()