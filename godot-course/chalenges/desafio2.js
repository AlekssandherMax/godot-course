const read = require('prompt-sync')({sigint: true})

var V = read("Digite a quandtidade de vitórias do jogador: ")
var D = read("\bDigite a quantidade de derrotas do jgoador: ")

var player = {vitorias: V, derrotas: D}
var saldo = player.vitorias - player.derrotas

function calcRank() {
    
    if (saldo < 10) return " Ferro"

    if (saldo > 10 && saldo <= 20) return " Bronze"

    if (saldo > 20 && saldo <= 50) return " Prata"

    if (saldo > 50 && saldo <= 80) return " Ouro"

    if (saldo > 80 && saldo <= 90) return " Diamante"

    if (saldo > 90 && saldo == 100) return " Lendário"

    if (saldo >= 101) return " Imortal"

    else return "... digite valores válidos (numeros)."
}

console.log(`O Herói tem de saldo de ${player.vitorias} vitórias e ${player.derrotas} derrotas, sendo assim está classificado no nível de${calcRank()}`)