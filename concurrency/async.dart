Future<void> checkVersion() async {
  //用于等待异步函数结果的代码
  var version = await lookUpVersion();
}

//将关键字添加到函数中会使其返回 Future。 例如，考虑这个同步函数， 它返回一个字符串：async
lookUpVersion() => '1.0.0';
// 如果函数未返回有用值， 使其返回类型 .Future<void>
Future<String> lookUpVersion1() async => '1.0.0';
//用 await 时遇到编译时错误， 确保 await 处于异步函数中。例如，要在应用的功能中使用， 的正文必须标记为：awaitmain()main()async
Future<void> main(List<String> args) async {
  var entrypoint = await findEntryPoint();
  var exitCode = await runExecutable(entrypoint, args);
  await flushThenExit(exitCode);
  checkVersion();
  print('In main: version is ${await lookUpVersion()}');
  var expression;
  //异步 for 循环如果在实现异步 for 循环时遇到编译时错误， 确保 await for 位于异步函数中。
  await for (varOrType identifier in expression) {}
  var requestServer;
  await for (final request in requestServer) {
    handleRequest(request);
  }
}

void handleRequest(request) {}

class varOrType {}

flushThenExit(exitCode) {}

runExecutable(entrypoint, List<String> args) {}

findEntryPoint() {}
