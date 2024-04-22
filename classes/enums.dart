enum Color { red, green, blue }
// Dart 还允许枚举声明来声明类 具有字段、方法和 const 构造函数 它们仅限于固定数量的已知常量实例。
// 要声明增强的枚举， 遵循类似于普通类的语法， 但有一些额外的要求：
// 实例变量必须是 ， 包括 mixins 添加的那些。final
// 所有生成构造函数都必须是常量的。
// 工厂构造函数只能返回 一个固定的已知枚举实例。
// 由于 Enum 是自动扩展的，因此无法扩展其他类。
// 不能覆盖 、 等式运算符。indexhashCode==
// 不能在枚举中声明已命名的成员， 因为它会与自动生成的静态 getter 冲突。valuesvalues
// 必须声明枚举的所有实例 在宣言的开头， 并且必须至少声明一个实例。
// 增强枚举中的实例方法可用于 引用当前枚举值。this
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}

void main() {
  //使用枚举
  final favoriteColor = Color.blue;
  if (favoriteColor == Color.blue) {
    print('Your favorite color is blue!');
  }
//枚举中的每个值都有一个 getter， 它返回枚举声明中值的从零开始的位置。 例如，第一个值的索引为 0， 第二个值的索引为 1。
  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);
//获取所有枚举值的列表， 使用枚举的常量。values
  List<Color> colors = Color.values;
  assert(colors[2] == Color.blue);
  var aColor = Color.blue;
//可以在 switch 语句中使用枚举，并且 如果不处理枚举的所有值，则会收到警告
  switch (aColor) {
    case Color.red:
      print('Red as roses!');
    case Color.green:
      print('Green as grass!');
    default:
      print(aColor);
  }
  print(Color.blue.name); // 'blue'
  print(Vehicle.car.carbonFootprint);
}
