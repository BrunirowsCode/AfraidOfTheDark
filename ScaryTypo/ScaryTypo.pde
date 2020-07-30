String message;
Walker[] walkers;
PointLight light;
boolean useLights;

void setup()
{
  PFont font = createFont("Georgia", 30);
  textFont(font);
  useLights = true;
  size(800, 300);
  textAlign(CENTER, CENTER);
  message = "We are afraid of the dark!";
  background(0);
  textSize(30);
  float x = 150;
  walkers = new Walker[message.length()];
  for (int i = 0; i < message.length(); ++i)
  {
    char c = message.charAt(i);
    PVector p = new PVector(x, height/2);
    x+=20;
    walkers[i] = new Walker(c, p);
  }
  light = new PointLight(new PVector(width /2, height / 2), color(255), 0.8, 250);
}

void draw()
{
  background(useLights ? 255 : 0);
  textAlign(CENTER);
  fill(useLights ? 100 : 200);
  rect(20, 20, 25, 25);
  fill(useLights ? 200 : 100);
  rect(45, 20, 25, 25);
  text(useLights ? "On" : "Off", 45, 75);
  textAlign(CORNER);
  for (Walker w : walkers)
  {
    color c = color(0);
    if (useLights)
    {
      c = color(0);
    } else
    {
      c = color(255);
    }
    fill(c);
    w.update();
    w.display();
  }
}

void mousePressed()
{
  if (mouseX > 20 && mouseX < 70 && mouseY > 20 && mouseY < 45)
  {
    useLights = !useLights;
    if (!useLights)
    {
      for (Walker w : walkers)
      {
        w.scare();
      }
    } else
    {
      for (Walker w : walkers)
      {
        w.notScare();
      }
    }
  }
}

PVector GetLightingColor(PVector pos)
{
  float r =0, g = 0, b = 0;
  float distance = constrain(PVector.dist(light.pos, pos), 0, light.range);
  float reach = light.range - distance;
  float map = map(reach, 0, light.range, 0, 1);
  r+=((float)red(light.col) * map * light.intensity);
  g+=((float)green(light.col) * map * light.intensity);
  b+=((float)blue(light.col) * map * light.intensity);

  r = map(r, 0, 255, 0, 1);
  g = map(g, 0, 255, 0, 1);
  b = map(b, 0, 255, 0, 1);

  return new PVector(r, g, b);
}
