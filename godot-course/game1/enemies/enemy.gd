class_name enemy

extends Node2D

@export var health: int = 10

func damage(amount: int):
	health -= amount
	print("Inimigo recebeu dano de ", amount, "e a vida atual é ", health)
