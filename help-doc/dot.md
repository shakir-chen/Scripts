graphviz-dot learning
============

# dot
subgraph

```
digraph {
		subgraph cluster_0 {
			label="Subgraph A";
			a -> b;
			b -> c;
			c -> d;
		}

		subgraph cluster_1 {
			label="Subgraph B";
			a -> f;
			f -> c;
		}
	}
```

```
digraph {
        splines=line;
        /* declare the node & style them */
        "Content" [style=filled,fillcolor="#9ACEEB" ];
        "Service Object" [style=filled,fillcolor="#9ACEEB" ];
        "IT" [style=filled,fillcolor="#f28c3e"];

        subgraph cluster_1 {
            style=invis
			label="Subgraph B";
		}

        "Operation"->"Content";
        "Service Object"->"Content";
}
```

<http://graphs.grevian.org/example#example-3>

# graphviz
dot -Tx11 XXX.dot
dot -Tpng XXX.dot > XXX.png

dot, circo, fdp, twopi, neato
<http://www.graphviz.org/doc/info/command.html>


