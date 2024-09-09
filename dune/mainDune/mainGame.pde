//MARK: - Main Game
void gamePlay() {
  image(imgGame, 0, 0); // fundo base
  textFont(gameScore);
  fill(255);
  textSize(24);
  text(score, 90, 55); //retorna o score na tela

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
  sharkY = sharkY + 4;
  if (sharkY > height) {
    sharkX = int(random(width - 40)); //aleatoriamente uma parte lateral
    sharkY = 0; //inicio
  }

  //Parte do tubarão
  image(spriteChop[(frameCount/10)%2], chopX, chopY, 40, 40);
  chopY = chopY + 4;
  if (chopY > height) {
    chopX = int(random(width - 40)); //aleatoriamente uma parte lateral
    // o -40 é por conta da alteração do sprite, então é para não cortar na tela
    chopY = 0; //começa do teto
  }


  colisaoL();
  checkGameOver();
}

//MARK: - Game Exp
// reseta o jogo quando volta pra tela inicial dentro do mainGame
void resetGame() {
  score = 0;
  life = 3; // condição pro gameOver deve ser resetada aqui também
  posx = width / 2;
  posy = height / 2 + 200;
  dirx = 0;
  diry = 0;
  sharkX = int(random(width));
  sharkY = 0;
  chopX = int(random(width));
  chopY = 0;
}

void checkGameOver() {
  if (life == 0) {
    gameOver = true;
    screen = 4;
  }
}

//MARK: - Movimentação
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

//MARK: - LIFE
void drawLives() {
  int heartWidth = heart.width;
  int startX = width - (life * (heartWidth + 10)); // posicao inicial

  for (int i = 0; i < life; i++) {
    image(heart, startX + i * (heartWidth + 10), 10);
  }
}

void removeLife() {
  if (life > 0) {
    life--;
  }
}
