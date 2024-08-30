void desenharBotoes() {
  //Declarei um array pra listar as opções
  String[] opcoes = {"Neo", "Trinity", "Morpheus", "Oraculo", "MatrixComputer"};
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
    case 0: return "Neo";
    case 1: return "Trinity";
    case 2: return "Morpheus";
    case 3: return "Oraculo";
    case 4: return "errorStopPC";
    default: return "Desconhecido";
  }
}
