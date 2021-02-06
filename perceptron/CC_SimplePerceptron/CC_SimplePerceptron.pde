Perceptron p;

Point[] points = new Point[100];

int trainingIndex = 0;

void setup() {
  size(800, 800);
  p = new Perceptron();
  
  for(int i = 0; i < points.length; i++){
    points[i] = new Point();
  }
  
  display();
}

void draw() {
}

void display(){
  background(255);
  stroke(0);
  line(0, 0, width, height);
  for(Point pt : points){
    pt.show();
  
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    int guess = p.guess(inputs);
    if(guess == target){
      fill(0, 255, 0);
    }else{
      fill(255, 0, 0);
    }
 
    noStroke();
    ellipse(pt.x, pt.y, 8, 8);
  }
}

void trainOne(Point pt){
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    p.train(inputs, target);
}

void trainAll(){
  for(Point pt : points){
    trainOne(pt);
  }
}

//training on mouse click
void mousePressed(){
  
  /* Train all 
  trainAll();
  */
  
  /*Train one at a time*/
  trainOne(points[trainingIndex]);
  trainingIndex = (trainingIndex + 1) % points.length;
  /**/
  
  display();
}
