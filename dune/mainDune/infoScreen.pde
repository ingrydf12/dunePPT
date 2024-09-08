//MARK: - Info
//Tipo um "carrossel de imagens" pra explicar o jogo
void carrosselImg(){
  //Seta a imagem que vai aparecer a cada mudança do counter
  // O counter é incrementado ou decrementado? a cada interação do user com os chevron
  if (counter == 0) {
    image(imgInfo1, 0, 0, width, height);
  } else if (counter == 1) {
    image(imgInfo2, 0, 0, width, height);
  } else if (counter == 2) {
    image(imgInfo3, 0, 0, width, height);
  } else if (counter == 3) {
    image(imgInfo4, 0, 0, width, height);
  }
  
  //INTERACOES E VERIFICACAO DELAS
  if (mousePressed && !lastMousePressed && !clicou) {
      //Pra avançar o carrossel no botão
      if (mouseX >= 600 && mouseX <= 630 && mouseY >= 232 && mouseY <= 262) {
        counter++;
        clicou = true;
      }
      
      //Volta o carrossel incrível
      else if (mouseX >= 80 && mouseX <= 108 && mouseY >= 232 && mouseY <= 262) {
        counter--;
        clicou = true;
      }
    }

    // Reseta o clique após o botão do mouse ser solto
    if (!mousePressed) {
      lastMousePressed = false;
      clicou = false;
    } else {
      lastMousePressed = true;
    }


    if (counter > 3) {
      counter = 0; // reinicia o counter
    }
}

//MARK: - Pause Screen
void drawPauseScreen() {
  imgPause = loadImage("assets/imgPause.png");
  image(imgPause, 0, 0, width, height); // Desenha a imagem da tela de pausa
}
