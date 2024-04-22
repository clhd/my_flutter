var name = 'Bob'; //局部变量
Object name1 = ' '; //可变类型变量
String name2 = '  '; //指定类型变量
String? name3; //可以为空
late String aa; //延迟初始化，可以暂时不在声明时初始化
String name4 = '111'; // 不能为空必须赋初值
int? lineCount1;
final name5 = 'Bob'; // 没有声明类型
final String nickname = 'Bobby';
const bar = 1000000; //
const double atm = 1.01325 * bar;
const Object i = 3;
const list = [i as int];
const map = {if (i is int) i: 'int'};
const set = {if (list is List<int>) ...list};
var foo = const [];
final bar1 = const [];
const baz = [];
void main() {
  int lineCount1;

  bool weLikeToCount = true;
  if (weLikeToCount) {
    lineCount1 = countLines();
  // ignore: dead_code
  } else {
    lineCount1 = 0;
  }
  aa = '1214646';
  print(aa);
  print(lineCount1);
}

int countLines() {
  return 1;
}
