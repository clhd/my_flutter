//Mixins 是一种定义代码的方法，可以在多个类层次结构中重用。 它们旨在为成员提供集体实现。
// 要使用 mixin，请使用关键字后跟一个或多个 mixin 名字。下面的示例显示了两个使用 mixin 的类：with
class Musician extends Performer with Musical {
  // ···
}
class Performer{

}
class Person{

}
mixin Aggressive{

}
mixin Demented{

}
class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
  
  set name(String name) {}
}


//定义 mixin，请使用声明。 在极少数情况下，您需要同时定义 mixin 和类，您可以使用 mixin 类声明。mixin
// Mixins 和 mixin 类不能有子句， 并且不得声明任何生成构造函数。extends
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

mixin MusicalPerformer on Musician {
  // ...
}
class SingerDancer extends Musician with MusicalPerformer {
  // ...
}
abstract mixin class Musician1 {
  // No 'on' clause, but an abstract method that other types must define if 
  // they want to use (mix in or extend) Musician: 
  void playInstrument(String instrumentName);

  void playPiano() {
    playInstrument('Piano');
  }
  void playFlute() {
    playInstrument('Flute');
  }
}

class Virtuoso with Musician1 { 
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName beautifully');
  }  
} 

class Novice extends Musician { 
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName poorly');
  }  
}