const read = require('prompt-sync')({sigint: true})

var player = read('Digite o nome do jogador: ')

var xp = 0
var xp = read('\bInsira a quantidade de xp de seu personagem: ')

if (xp < 1000) {
    console.clear();
    console.log(`O Herói de nome ${player} está no nível de ferro`);
} else if (xp > 1001 && xp < 2000) {
    console.clear();
    console.log(`O Herói de nome ${player} está no nível de bronze`);
} else if (xp > 2001 && xp < 5000) {
    console.clear();
    console.log(`O Herói de nome ${player} está no nível de prata`);
} else if (xp > 5001 && xp < 7000) {
    console.clear();
    console.log(`O Herói de nome ${player} está no nível de ouro`);
} else if (xp > 7001 && xp < 8000) {
    console.clear();
    console.log(`O Herói de nome ${player} está no nível de platina`);
} else if (xp > 8001 && xp < 9000) {
    console.clear();
    console.log(`O Herói de nome ${player} está no nível de ascendente`);
} else if (xp > 9001 && xp < 10000) {
    console.clear();
    console.log(`O Herói de nome ${player} está no nível de imortal`);
} else if (xp >= 10001) {
    console.clear();
    console.log(`O Herói de nome ${player} está no nível de radiante`);
} else {
    console.clear();
    console.log("Valor de xp inválido");
}
