void desenharBotoes(){
  image(bNeo, 60, 560);
  image(bTrin, 300, 560); //Tamanho do botão (250) + espaçamento (50)
  image(bMorp, 540, 560);
  image(bOrac, 780, 560);
  image(bPC, 1020, 560);
}

String getChoiceName(int choice) {
  //não sei se poderia usar o switch/case já, porém achei mais prático do que colocar um monte de if
  //serve pra retornar as escolhas, no caso uma string, tanto da cpu como userInput, aí só precisa definir quando chamar 
  switch(choice) {
    case 0: return "Neo";
    case 1: return "Trinity";
    case 2: return "Morpheus";
    case 3: return "Oraculo";
    case 4: return "PC da Matrix";
    default: return "Desconhecido";
  }
}
