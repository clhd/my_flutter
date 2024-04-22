const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
  //命名构造函数 超类的命名构造函数不由子类继承
  Point.origin()
      : x = xOrigin,
        y = yOrigin;
//还可以初始化 实例变量，然后运行构造函数主体。分开 带逗号的初始值设定项。
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }
  Point.withAssert(this.x, this.y) : assert(x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }
//构造函数的唯一目的是重定向到另一个构造函数 构造函数。重定向构造函数的主体是 空，使用构造函数调用 （使用代替类名） 出现在冒号 （:).this
  Point.alongXAxis(double x) : this(x, 0);
}

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
  final double z;

  //超级参数
  Vector3d(super.x, super.y, this.z);
}
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}
class Logger {
  final String name;
  bool mute = false;


  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}
void main(){
  var logger = Logger('UI');
logger.log('Button clicked');

var logMap = {'name': 'UI'};
var loggerJson = Logger.fromJson(logMap);
}