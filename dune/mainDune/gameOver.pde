void gameOverScreen() {
  image(imgOver, 0, 0); // OK,
  fill(0);
  text(score, 540, 390);

  if (mouseX >= 386 && mouseX <= 615 && mouseY >= 234 && mouseY <= 280) {
    image(bPlayAgainH, 382, 234); // Desenha imagem de hover do botão "Play Again"
  }

  if (mouseX >= 386 && mouseX <= 615 && mouseY >= 290 && mouseY <= 335) {
    image(bMenuH, 382, 290); // Desenha imagem de hover do botão "Menu"
  }

  if (mousePressed) {
    if (mouseX >= 386 && mouseX <= 615 && mouseY >= 234 && mouseY <= 280) {
      println(gameOver);
      gameOver = false;
      screen = 1;
      resetGame(); // Reseta o jogo
    }

    if (mouseX >= 386 && mouseX <= 615 && mouseY >= 290 && mouseY <= 335) {
      gameOver = false;
      screen = 0;
      resetGame();
    }
  }
}
