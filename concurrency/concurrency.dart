import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

const String filename = 'with_keys.json';
void main(List<String> args) {
  //事件循环函数的方式
//   while (eventQueue.waitForEvent()) {
//   eventQueue.processNextEvent();
// }
//发出网络请求
// http.get('https://example.com').then((response) {
//   if (response.statusCode == 200) {
//     print('Success!')'
//   }
// }
//读取数据
  final fileData = _readFileSync();
  final jsonData = jsonDecode(fileData);
  //使用数据
  print('Number of JSON keys: ${jsonData.length}');
}
String _readFileSync() {
  final file = File(filename);
  final contents = file.readAsStringSync();
  return contents.trim();
}
Future<String> _readFileAsync2() async {
  final file = File(filename);
  final contents = await file.readAsString();
  return contents.trim();
}

Future<String> _readFileAsync1() async {
  final file = File(filename);
  final contents = await file.readAsString();
  return contents.trim();
}

//返回类型表示最终的类型（或错误）
Future<String> _readFileAsync(String filename) {
  final file = File(filename);

  return file.readAsString().then((contents) {
    return contents.trim();
  });
}
Stream<int> sumStream(Stream<int> stream) async* {
  var sum = 0;
  await for (final value in stream) {
    yield sum += value;
  }
}
int slowFib(int n) => n <= 1 ? 1 : slowFib(n - 1) + slowFib(n - 2);
//回调
void fib40() async {
  var result = await Isolate.run(() => slowFib(40));
  print('Fib(40) = $result');
}
