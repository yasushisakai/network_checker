
import ai.pathfinder;


String geojsonFile = "test.geojson";

RoadNetwork network = new RoadNetwork(geojsonFile, "test");

ArrayList<Node> nodes = network.graph.nodes;

println("checking " + nodes.size() + " nodes");

for(Node from : nodes){
    for(Node to : nodes){
        if(from == to){
            continue;
        }
        ArrayList<Node> path = null;
        try{
            path = network.graph.aStar(from, to);
        } catch (Excetion e) {
            printStatus("error calculating shortest path via aStar", from, to);          
        }

        if(path != null) {
            if(path.size() < 2) {
                printStatus("not enough nodes in path, node count: " + path.size(), from, to);
            }
        }
    }
}


void printNode(String is, Node n){
    println(is + ": " + "(" + n.x + ", " + n.y + ")");
}

void printStatus(String mes, Node from, Node to) {
    println(mes);
    printNode("source", from);
    printNode("destination", to);
}