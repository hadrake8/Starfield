Particle[] A;
OddballParticle B;
Planet C;
void setup()
{
	size(300,300);

	A = new Particle[300];
	for (int i=0; i<A.length; i++)
	{
		A[i] = new Particle();
	}

	C = new Planet();

	B = new OddballParticle();

	


}
void draw()
{
	background(0);


	for (int i=0; i<A.length; i++)
	{
		A[i].show();
		A[i].move();
	}

	
	C.show();
	C.move();
	C.hit();
	

	B.show();
	B.move();

	


}
class Particle
{
	double myX;
	double myY;
	double size;
	double angle;
	double speed;

	Particle() 
	{
		myX = 150.0;
		myY = 150.0;
		size = 1.0;
		angle = Math.random()*2*Math.PI;
		speed = Math.random()*20;

		 
	}
	void move()
	{
		if (myX>300 || myX<0)
		{
			myX = 150.0;
			size = 1.0;
		}
		else if ( myY>300 || myY<0)
		{
			myY = 150.0;
			size = 1.0;
		}
		if (size>3){
			size = 1;
		}

		myX = myX + Math.cos(angle)* speed;
		myY = myY + Math.sin(angle)*speed;
		size = size + 0.05;



	}
	void show()
	{
		ellipse((float)myX,(float)myY,(float)size,(float)size);
	}
}



class OddballParticle //inherits from Particle
{
	int oddX;
	int oddY;
	OddballParticle()
	{
		oddX = 150;
		oddY = 150;

	}
	void move()
	{
		oddX = mouseX;
		oddY = mouseY;
	}
	void show()
	{
		fill(0,100,100);
		ellipse(oddX, oddY, 20,20);
		fill(200);
		ellipse(oddX, oddY+5, 40,10);
	}
	
}
class Planet extends  OddballParticle
{
	int pX;
	int pY;
	int c;
	int count;
	
	Planet()
	{
		pX = (int)Math.random()*300;
		pY = 150;
		c = 100;
		count = 0;
		

	}
	void move()
	{

		

		
		if(mouseX > pX)
 		{
 			pX = pX + (int)(Math.random()*5 -1);
 		}else{
 			pX = pX + (int)(Math.random()*5 -3);
		}

		if(mouseY > pY)
		{
			pY = pY + (int)(Math.random()*5 -1);
		}else{
			pY = pY + (int)(Math.random()*5 -3);
		}

		if (pX>300 || pX<0 || pY>300 || pY<0)
		{
			pY = 150;
			pX = 150;
		}
		

	}
	void show()
	{
		fill(200,10,0);
		ellipse(pX,pY,10,10);

	}
	void hit()
	{
		if (mouseX == pX && mouseY == pY )
		{
			pX = 150;
			pY = 150;
			count = count+1;
		}
		text(count,280,280);



	}

}



