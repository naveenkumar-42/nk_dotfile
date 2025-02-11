import java.util.*;

public class Main {
  public static void main(String[] args) {
    int[][] graph = {
      {0, 1, 0, 1},
      {1, 0, 1, 0},
      {0, 1, 0, 1},
      {1, 0, 1, 0}
    };

    if (isBipartite(graph)) {
      System.out.println("The graph is bipartite.");
    } else {
      System.out.println("The graph is not bipartite.");
    }
  }

  public static boolean isBipartite(int[][] graph) {
    int n = graph.length;
    int[] colors = new int[n];
    Arrays.fill(colors, -1);

    for (int i = 0; i < n; i++) {
      if (colors[i] == -1) {
        if (!bfsCheck(graph, i, colors)) {
          return false;
        }
      }
    }
    return true;
  }

  private static boolean bfsCheck(int[][] graph, int src, int[] colors) {
    Queue<Integer> queue = new LinkedList<>();
    queue.add(src);
    colors[src] = 1;

    while (!queue.isEmpty()) {
      int node = queue.poll();

      for (int neighbor = 0; neighbor < graph.length; neighbor++) {
        if (graph[node][neighbor] == 1) {
          if (colors[neighbor] == -1) {
            colors[neighbor] = 1 - colors[node];
            queue.add(neighbor);
          } else if (colors[neighbor] == colors[node]) {
            return false;
          }
        }
      }
    }
    return true;
  }
}                          