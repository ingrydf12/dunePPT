int userInput = -1;
float cpu;

void setup() {
  size(400, 400);
  textSize(20);
  cpu = int(random(0, 5)); 
}

void draw() {
  background(255);
  if (userInput != -1) {
    //Retorno
    text("Você escolheu: " + getChoiceName(userInput), 20, 50);
    text("CPU escolheu: " + getChoiceName((int)cpu), 20, 100);
    verificarVencedor();
  } else {
    text("Clique em um botão para escolher", 20, 50);
    desenharBotoes();
  }
}


//Pegando os tamanhos dos botões
void mousePressed() {
  for (int i = 0; i < 5; i++) {
    if (mouseX > 20 && mouseX < 170 && mouseY > 100 + i * 50 && mouseY < 140 + i * 50) {
      userInput = i;
    }
  }
}

void verificarVencedor() {
  if (userInput == 0) { // Spock
    if (cpu == 1 || cpu == 3) {
      println("Spock win");
    } else if (cpu == 2 || cpu == 4) {
      println("CPU win");
    } else {
      println("Empate");
    }
  }
  if (userInput == 1) { // Tesoura
    if (cpu == 2 || cpu == 4) {
      println("Tesoura win");
    } else if (cpu == 0 || cpu == 3) {
      println("CPU win");
    } else {
      println("Empate");
    }
  }

  if (userInput == 2) { // Papel
    if (cpu == 0 || cpu == 3) {
      println("Papel win");
    } else if (cpu == 1 || cpu == 4) {
      println("CPU win");
    } else {
      println("Empate");
    }
  }

  if (userInput == 3) { // Pedra
    if (cpu == 1 || cpu == 4) {
      println("Pedra win");
    } else if (cpu == 0 || cpu == 2) {
      println("CPU win");
    } else {
      println("Empate");
    }
  }

  if (userInput == 4) { // Lagarto
    if (cpu == 0 || cpu == 2) {
      println("Lagarto win");
    } else if (cpu == 1 || cpu == 3) {
      println("CPU win");
    } else {
      println("Empate");
    }
  }
}
