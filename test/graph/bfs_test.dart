import 'package:test/test.dart';

import 'package:algorithms/graph/bfs.dart';
import 'package:algorithms/graph/simple_graph.dart';
import 'package:algorithms/graph/vertex.dart';

void main() {
  SimpleGraph? graph;
  Vertex? u, v, w, x, y, z;

  void _initializeVertices() {
    u = Vertex('U');
    v = Vertex('V');
    w = Vertex('W');
    x = Vertex('X');
    y = Vertex('Y');
    z = Vertex('Z');
  }

  setUp(() {
    _initializeVertices();
    graph = SimpleGraph(isDigraph: true);
    /*    v --- y
         /      |
        u ----- z
         \
          w -- x
    */
    graph!.addEdge(u!, v!);
    graph!.addEdge(u!, w!);
    graph!.addEdge(u!, z!);
    graph!.addEdge(v!, y!);
    graph!.addEdge(w!, x!);
    graph!.addEdge(y!, z!);
  });

  test('Test BFS', () {
    var traversal = traverse(graph!, u!);
    expect(traversal.visits, equals([u, v, w, z, y, x]));

    traversal = traverse(graph!, w!);
    expect(traversal.visits, <Vertex>[w!, x!]);

    traversal = traverse(graph!, z!);
    expect(traversal.visits, <Vertex>[z!]);
  });
}
