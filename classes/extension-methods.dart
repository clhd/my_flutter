//import 'string_apis.dart';
// 如果扩展成员与 接口或与其他扩展成员， 那么你有几个选择。

// 一种选择是更改导入冲突扩展的方式， 使用 OR 限制公开的 API：showhide

// import 'string_apis.dart';

// import 'string_apis_2.dart' hide NumberParsing2;
// print('42'.parseInt());
// 另一种选择是显式应用扩展， 这会导致代码看起来好像扩展是一个包装类：

// import 'string_apis.dart'; // Contains NumberParsing extension.
// import 'string_apis_2.dart'; // Contains NumberParsing2 extension.

// print('42'.parseInt());
// print(NumberParsing('42').parseInt());
// print(NumberParsing2('42').parseInt());
// content_copy
// 如果两个扩展名同名， 然后，可能需要使用前缀导入：

// extension (in 'string_apis_3.dart') also defines parseNum().
// import 'string_apis.dart';
// import 'string_apis_3.dart' as rad;

// print('42'.parseInt()); .

// print(NumberParsing('42').parseInt());
// print(rad.NumberParsing('42').parseInt());

// print('42'.parseNum());
void main(List<String> args) {
  //字符串分析为整数的代码：
  int.parse('42');
  // print('42'.parseInt());
  print('42'.padLeft(5));
  // print('42'.parseInt());
  //不能对 类型的变量调用扩展方法。 例如，以下代码会导致运行时异常：dynamic
  dynamic d = '2';
  print(d.parseInt());
  var v = '2';
  // print(v.parseInt()); // Output: 2
}

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
  // ···
}

//实现扩展方法
// extension <extension name>? on <type> {
//   (<member definition>)*
// }
//在类上实现扩展
extension NumberParsing1 on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

//未命名的扩展
extension on String {
  bool get isBlank => trim().isEmpty;
}

//泛型扩展
extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
