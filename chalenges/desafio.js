const read = require('prompt-sync')({sigint: true})

var player = read('Digite o nome do jogador: ')

var xp = 0
var xp = read('\bInsira a quantidade de xp de seu personagem: ')

function rank(xp) {
if (xp <= 1000) return "ferro"

    else if (xp > 1001 && xp < 2000) return " bronze"

    else if (xp > 2001 && xp < 5000) return " prata"

    else if (xp > 5001 && xp < 7000) return " ouro"

    else if (xp > 7001 && xp < 8000) return " platina"

    else if (xp > 8001 && xp < 9000) return " ascendente"

    else if (xp > 9001 && xp < 10000) return " imortal"

    else if (xp > 10001) return " radiante"

    else return "... Ops, digite um número!" 

}
  console.log(`O personagem ${player} está no nível${rank(xp)}`)