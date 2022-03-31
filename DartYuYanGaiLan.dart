import 'dart:async';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
//导入API

void main() {
  //变量声明
  var name = 'Voyager 1';
  var year = 1997;
  var antennaDiameter = 3.7;
  var flybyObject = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  print("this is the name: $name,this is year: ${year},");
  //控制语句
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  var flybyObjects = [1, 2, 3, 4, 5];

  for (final object in flybyObjects) {
    print(object);
  }
  print("month:\n");
  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  var result = fibonacci(10);

  //箭头函数
  () => print('箭头函数1');
  print("result is ${result}");

  //测试类的运用
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

//继承一个类

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}

//Mixins的测试
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

//Mixins测试
/*class PilotedCraft extends Spacecraft with Piloted {

 
}*/
//接口测试
/*class MockSpaceship implements Spacecraft {

}*/
//抽象类的测试
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('====*******=====');
    describe();
    print('=====*******====');
  }
}

//dart的异步
void YIBU() {
  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }
}

Future<void> printWithDelay(String message) {
  return Future.delayed(Duration.zero).then((_) {
    print(message);
  });
}

Future<void> createDescription(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}
//使用async*关键字

Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(Duration.zero);
    yield '${craft.name} flies by $object';
  }
}

//dart中异常的处理

void TestError() {
  //测试throw
  var astronauts = 0;
  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }
  //测试try语句
  List flybyObjects = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
  try {
    for (final object in flybyObjects) {
      //var description = await File('$object.txt').readAsString();
      var description = 'Gello dart!';
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}
