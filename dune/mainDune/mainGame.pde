void gamePlay() {
  if (screen == 1) {
    score = 0;

    image(imgGame, 0, 0); // fundo base
    textFont(gameScore);
    fill(255);
    textSize(24);
    text(score, 90, 50); //retorna o score na tela


    //atualiza a posicao do sprite
    posx += dirx*6;
    posy += diry*6;


    // Checagem tamanho da tela
    if (posx < 0) {
      posx = 0;
    } else if (posx > width - 40) {
      posx = width - 40;
    }

    if (posy < 0) {
      posy = 0;
    } else if (posy > height - 40) { // 40 é a altura do sprite
      posy = height - 40;
    }

    //aqui ele desenha o sprite junto com a animacao incrível
    image(sprites[(frameCount/10)%2], posx, posy, 40, 40); //player

    //Parte do tubarão
    image(spriteShark[(frameCount/10)%2], sharkX, sharkY, 40, 40);
    //Descida do tubarão (velocidade)
    sharkY = sharkY + 3;
    //Checar colisão para reaparecer (com a borda)
    if (sharkY > height) {
      sharkX = int(random(width)); //aleatoriamente uma parte lateral
      sharkY = 0; //começa do teto
    }
    
    //Parte do tubarão
    image(spriteChop[(frameCount/10)%2], chopX, chopY, 40, 40);
    //Descida do tubarão (velocidade)
    chopY = chopY + 3;
    //Checar colisão para reaparecer (com a borda)
    if (chopY > height) {
      chopX = int(random(width)); //aleatoriamente uma parte lateral
      chopY = 0; //começa do teto
    }
  }
}

// reseta o jogo quando volta pra tela inicial dentro do mainGame
void resetGame() {
  score = 0;
  posx = width / 2;
  posy = height / 2 + 200;
  dirx = 0;
  diry = 0;
  sharkX = int(random(width));
  sharkY = 0;
  chopX = int(random(width));
  chopY = 0;
}

//Movimentação
void keyPressed() {
  if (key == 'R' || key == 'r') {
    gameIsPaused = !gameIsPaused; // Alterna o estado de pausa
  } else if (gameIsPaused && (key == 'M' || key == 'm')) {
    screen = 0;
    resetGame();
    gameIsPaused = false; // Sai do estado de pausa
  } else if (gameIsPaused && (key == 'V' || key == 'v')) {
    gameIsPaused = false; // Sai do estado de pausa
  }

  if (!gameIsPaused) {
    if (key == 'A' || key == 'a') dirx = -1;
    if (key == 'D' || key == 'd') dirx = 1;
    if (key == 'W' || key == 'w') diry = -1;
    if (key == 'S' || key == 's') diry = 1;
  }
}

void keyReleased() {
  if (!gameIsPaused) {
    if (key == 'A' || key == 'a') dirx = 0;
    if (key == 'D' || key == 'd') dirx = 0;
    if (key == 'W' || key == 'w') diry = 0;
    if (key == 'S' || key == 's') diry = 0;
  }
}
