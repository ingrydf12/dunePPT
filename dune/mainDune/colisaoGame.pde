//configuração da colisao do player com o chop (safe)
void colisaoL(){
  if (checkCollision(posx, posy, 40, 40, chopX, chopY, 40, 40)) {
    chopX = -100;
    chopY = -100;
    score += 1;
  }
  
  if (checkCollision(posx, posy, 40, 40, sharkX, sharkY, 40, 40)) {
    sharkX = -100;
    sharkY = -100;
    removeLife();
  }
}

// posicao X e Y do primeiro obj, w1 é só pra setar a altura que eu alterei pra 40, pos X e Y do seg obj...
boolean checkCollision(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  return (x1 < x2 + w2 && x1 + w1 > x2 && y1 < y2 + h2 && y1 + h1 > y2);
}
