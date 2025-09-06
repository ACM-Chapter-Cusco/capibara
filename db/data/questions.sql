USE capsule;

INSERT INTO questions (id, information, link, json_file) VALUES
(1, 'Problem A description', 'htttps://acm-cusco/banco-preguntas/edicion_x/a.json', '{"problem": "A", "title": "Simple Addition", "description": "Add two numbers"}'),
(2, 'Problem B description', 'htttps://acm-cusco/banco-preguntas/edicion_x/b.json', '{"problem": "B", "title": "Array Sum", "description": "Calculate sum of array elements"}'),
(3, 'Problem C description', 'htttps://acm-cusco/banco-preguntas/edicion_x/c.json', '{"problem": "C", "title": "String Reverse", "description": "Reverse a given string"}'),
(4, 'Problem D description', 'htttps://acm-cusco/banco-preguntas/edicion_x/d.json', '{"problem": "D", "title": "Prime Check", "description": "Check if number is prime"}'),
(5, 'Problem E description', 'htttps://acm-cusco/banco-preguntas/edicion_x/e.json', '{"problem": "E", "title": "Fibonacci", "description": "Generate fibonacci sequence"}'),
(6, 'Problem F description', 'htttps://acm-cusco/banco-preguntas/edicion_x/f.json', '{"problem": "F", "title": "Binary Search", "description": "Search element in sorted array"}'),
(7, 'Problem G description', 'htttps://acm-cusco/banco-preguntas/edicion_x/g.json', '{"problem": "G", "title": "Graph Traversal", "description": "Traverse graph using DFS"}'),
(8, 'Problem H description', 'htttps://acm-cusco/banco-preguntas/edicion_x/h.json', '{"problem": "H", "title": "Dynamic Programming", "description": "Solve knapsack problem"}'),
(9, 'Problem I description', 'htttps://acm-cusco/banco-preguntas/edicion_x/i.json', '{"problem": "I", "title": "Sorting Algorithm", "description": "Implement quicksort"}'),
(10, 'Problem J description', 'htttps://acm-cusco/banco-preguntas/edicion_x/j.json', '{"problem": "J", "title": "Tree Operations", "description": "Binary tree traversal"}'),
(11, 'Problem K description', 'htttps://acm-cusco/banco-preguntas/edicion_x/k.json', '{"problem": "K", "title": "Hash Table", "description": "Implement hash table operations"}'),
(12, 'Problem L description', 'htttps://acm-cusco/banco-preguntas/edicion_x/l.json', '{"problem": "L", "title": "Greedy Algorithm", "description": "Activity selection problem"}');

ALTER TABLE questions AUTO_INCREMENT = 13;
