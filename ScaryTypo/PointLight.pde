class PointLight
{
  float intensity;
  color col;
  float range;
  PVector pos;
  
  PointLight(PVector p, color c, float i, float r)
  {
    this.pos = p;
    this.col = c;
    this.intensity = i;
    this.range = r;
  }
}
