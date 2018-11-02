

String geojsonFile = "test.geojson";


int SIMULATION_WIDTH = 2128;
int SIMULATION_HEIGHT = 1330;
float scale = 1;

int nextPercent = 0;

void setup(){
  
  RoadNetwork network = new RoadNetwork(geojsonFile, "test");
  ArrayList<Node> nodes = network.graph.nodes;


  println("checking... " + nodes.size() + " nodes");
  int nodeCount = 0;
  for(Node from : nodes){
    
    
    float percent = int((nodeCount / (float) nodes.size()) * 10000) / (float)100;
    if(percent > nextPercent) {
      // float percent = ratio / (float)(10.0);
      println(nextPercent + "% done.(" + millis()/1000 + "s.)");
      nextPercent += 10;
    }
    
      for(Node to : nodes){
          if(from == to){
              continue;
          }
          ArrayList<Node> path = null;
          try{
              path = network.graph.aStar(from, to);
          } catch (Exception e) {
              printStatus("error calculating shortest path via aStar", from, to);          
          }
  
          if(path != null) {
              if(path.size() < 2) {
                  printStatus("not enough nodes in path, node count: " + path.size(), from, to);
              }
          }
      }
      
      nodeCount++;
  }
  
  println("end");
  exit();
}


void printNode(String is, Node n){
    println(is + ": " + "(" + n.x + ", " + n.y + ")");
}

void printStatus(String mes, Node from, Node to) {
    println(mes);
    printNode("source", from);
    printNode("destination", to);
}
