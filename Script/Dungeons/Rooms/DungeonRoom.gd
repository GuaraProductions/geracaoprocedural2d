extends Node2D
class_name DungeonRoom

@export var tamanho_rect : ColorRect
var tamanho_sala : Vector2

var saidas_e_vetores : Dictionary[Vector2i, Node2D]

func _ready() -> void:
	
	var saidas = get_tree().get_nodes_in_group(VectorMarker2D.GRUPO_NOME)
	
	for saida in saidas:
		saidas_e_vetores[saida.vetor_direcao] = saida
		
func remover_tile_de_porta(direcao: Vector2i) -> void:
	
	if saidas_e_vetores.has(direcao):
		
		var saida = saidas_e_vetores[direcao]
		
		for filho in saida.get_children():
			filho.queue_free()
			filho = null
