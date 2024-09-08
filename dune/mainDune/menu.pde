void menu() {
  //Parallax -> o foreground se move em loop com certa velocidade
  bgX -= 1;
  if (bgX <= -bg.width) {
    bgX = 0;
  }
  image(bg, bgX, 0);
  image(bg, bgX + bg.width, 0);

  // Movimento do primeiro plano
  fgX -= 2;
  if (fgX <= -fg.width) {
    fgX = 0;
  }
  image(fg, fgX, height - fg.height);
  image(fg, fgX + fg.width, height - fg.height);

  //criacao do titulo e botões
  image(title, 82, 143);
  image(bPn, 250, 270);
  image(bIn, 250, 340);

  //Hover interaction -> botões menu
  if (mouseX >= 250 && mouseX <= 450 && mouseY >= 270 && mouseY <= 320) {
    image(bPlayHover, 250, 270); //tive que alterar a posição pra preencher
  }

  if (mouseX >= 250 && mouseX <= 450 && mouseY >= 340 && mouseY <= 390) {
    image(bInfoHover, 250, 340); //tive que alterar a posição pra preencher
  }
  //Click event
  if (mousePressed) {
    // Verifica se o mouse está dentro da área específica para mudar a tela
    if (mouseX >= 250 && mouseX <= 450 && mouseY >= 270 && mouseY <= 320) {
      screen = 1;  // Muda para a tela do jogo
    }

    if (mouseX >= 250 && mouseX <= 450 && mouseY >= 340 && mouseY <= 390) {
      screen = 2;  // Muda para tela de info
    }
  }
}
