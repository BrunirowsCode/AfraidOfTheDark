class Walker
{
  PVector position;
  float rotation;
  char c;
  boolean afraid;
  float alpha;

  PVector originalPosition;

  Walker(char c, PVector p)
  {
    this.c = c;
    position = originalPosition = p;
    rotation = 0;
    afraid = false;
  }  

  void display()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(rotation));
    text(c, 0, 0);
    popMatrix();
  }

  void scare()
  {
    afraid = true;
    alpha = 0;
  }

  void notScare()
  {
    afraid = false;
  }

  void update()
  {
    if (afraid)
    {
      position.add(PVector.random2D().mult(2.5));
      rotation+=random(-15, 15);
    } else
    {
      position = PVector.lerp(position, originalPosition, alpha);
      rotation = lerp(rotation, 0, alpha);
      alpha+=0.003;
    }
  }
}
