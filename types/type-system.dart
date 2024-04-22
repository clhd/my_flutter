void printInts(List<int> a) => print(a);

void main() {
  final list = <int>[];
  list.add(1);
  list.add(2);
  printInts(list);
  num y = 3; // A num can be double or int.
y = 4.0;
// Inferred as if you wrote <int>[].
List<int> listOfInt = [];

// Inferred as if you wrote <double>[3.0].
var listOfDouble = [3.0];

// Inferred as Iterable<int>.
var ints = listOfDouble.map((x) => x.toInt());
}
class Animal {
  void chase(Animal a) {  }
  // Animal get parent =>  ;
}
class HoneyBadger extends Animal {
  @override
  void chase(Animal a) {  }

  // @override
  // HoneyBadger get parent => 
}
Map<String, dynamic> arguments = {'argA': 'hello', 'argB': 42};
var arguments1= {'argA': 'hello', 'argB': 42}; // Map<String, Object>
Cat c = Cat();
Cat c1 = MaineCoon() as Cat;
// List<Animal> myAnimals =  ;
// List<Cat> myCats = myAnimals as List<Cat>;
class MaineCoon {
}
class Cat {
}