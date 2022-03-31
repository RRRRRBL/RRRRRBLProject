void main() {
  var name = 'Voyager 1';
  var year = 1997;
  var antennaDiameter = 3.7;
  var flybyObject = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  print("this is the name: $name,this is year: ${year},");

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  var flybyObjects = [1, 2, 3, 4, 5];

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  var result = fibonacci(5);
  print("result is ${result}");
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
  
}
