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

func _on_BotaoConfigurar_pressed():
	get_tree().change_scene("res://EscolherJogador.tscn")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Inicio.tscn")
