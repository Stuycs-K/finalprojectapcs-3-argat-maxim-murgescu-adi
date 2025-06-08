public class Particle
{
  int col;
  PVector pos;
  PVector vel;
  float size = 20;
  PVector grav;
  
  public Particle(PVector pos, int _col)
  {
    this.pos = pos;
    this.vel = new PVector((float)Math.random()*3-1.5f, (float)Math.random()*3-1.5f);
    col = _col;
    grav = new PVector(0, 0.25f);
    size = 12 + (float)Math.random()*7f;
  }
  
  public void tick()
  {
    pos.add(vel);
    vel.add(grav);
    size -= 0.5;
  }
  public void render()
  { 
    stroke(0);
    fill(colors[col]);
    ellipse(pos.x, pos.y, size, size);
  }
}

public ArrayList<Particle> partsList = new ArrayList<Particle>();

void simParts()
{
  for(int i = 0; i < partsList.size(); i++)
  {
    partsList.get(i).tick();
    if(partsList.get(i).size <= 0)
    {
      partsList.remove(i);
      i--;
    }
    else
      partsList.get(i).render();
  }
}
