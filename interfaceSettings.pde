void desenharBotoes() {
  String[] opcoes = {"Spock", "Tesoura", "Papel", "Pedra", "Lagarto"};
  for (int i = 0; i < opcoes.length; i++) {
    fill(200);
    rect(20, 100 + i * 50, 150, 40);
    fill(0);
    text(opcoes[i], 25, 130 + i * 50);
  }
}

//Usando o switch pra retornar uma string dependendo da escolha
String getChoiceName(int choice) {
  switch(choice) {
    case 0: return "Spock";
    case 1: return "Tesoura";
    case 2: return "Papel";
    case 3: return "Pedra";
    case 4: return "Lagarto";
    default: return "Desconhecido";
  }
}
