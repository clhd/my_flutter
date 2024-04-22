import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

const String filename = 'with_keys.json';

void main() async {
  // 读取数据
  final jsonData = await Isolate.run(_readAndParseJson);
  final jsonData1 = await Isolate.run(() async {
    final fileData = await File(filename).readAsString();
    final jsonData = jsonDecode(fileData) as Map<String, dynamic>;
    return jsonData;
  });
  // 使用数据.
  print('Number of JSON keys: ${jsonData.length}');
}

Future<Map<String, dynamic>> _readAndParseJson() async {
  final fileData = await File(filename).readAsString();
  final jsonData = jsonDecode(fileData) as Map<String, dynamic>;
  return jsonData;
}

class Worker {
  Future<void> spawn() async {}

  void _handleResponsesFromIsolate(dynamic message) {}

  static void _startRemoteIsolate(SendPort port) {}

  Future<void> parseJson(String message) async {}
}
//生成工作线程隔离
Future<void> spawn() async {
  
  void Function(dynamic message)? _handleResponsesFromIsolate;
  
  await Isolate.spawn(_startRemoteIsolate , receivePort.sendPort);
}

static void _startRemoteIsolate(SendPort port) {
  final receivePort = ReceivePort();
  port.send(receivePort.sendPort);

  receivePort.listen((dynamic message) async {
    if (message is String) {
      final transformed = jsonDecode(message);
      port.send(transformed);
    }
  });
}
Future<void> spawn1() async {
  final receivePort = ReceivePort();
  receivePort.listen(_handleResponsesFromIsolate);
  await Isolate.spawn(_startRemoteIsolate, receivePort.sendPort);
}
void _handleResponsesFromIsolate(dynamic message) {
  if (message is SendPort) {
    _sendPort = message;
    _isolateReady.complete();
  } else if (message is Map<String, dynamic>) {
    print(message);
  }
}
Future<void> parseJson(String message) async {
  await _isolateReady.future;
  _sendPort.send(message);
}
class Worker {
  final SendPort _commands;
  final ReceivePort _responses;

  Future<Object?> parseJson(String message) async {
   
    _commands.send(message);
  }

  static Future<Worker> spawn() async {
    throw UnimplementedError();
  }

  Worker._(this._commands, this._responses) {
  
  }

  void _handleResponsesFromIsolate(dynamic message) {
   
  }

  static void _handleCommandsToIsolate(ReceivePort rp, SendPort sp) async {
    
  }

  static void _startRemoteIsolate(SendPort sp) {
   
  }
}
class Worker1 {
  final SendPort _commands;
  final ReceivePort _responses;

  static Future<Worker> spawn() async {
   
    final initPort = RawReceivePort();
    final connection = Completer<(ReceivePort, SendPort)>.sync();
    initPort.handler = (initialMessage) {
      final commandPort = initialMessage as SendPort;
      connection.complete((
        ReceivePort.fromRawReceivePort(initPort),
        commandPort,
      ));
    };
// ···
  }
  }
  class Worker2 {
  final SendPort _commands;
  final ReceivePort _responses;

  static Future<Worker> spawn() async {

    final initPort = RawReceivePort();
    final connection = Completer<(ReceivePort, SendPort)>.sync();
    initPort.handler = (initialMessage) {
      final commandPort = initialMessage as SendPort;
      connection.complete((
        ReceivePort.fromRawReceivePort(initPort),
        commandPort,
      ));
    };
 
    try {
      await Isolate.spawn(_startRemoteIsolate, (initPort.sendPort));
    } on Object {
      initPort.close();
      rethrow;
    }

    final (ReceivePort receivePort, SendPort sendPort) =
        await connection.future;

    return Worker._(sendPort, receivePort);
  }
  }
  class Worker3 {
  final SendPort _commands;
  final ReceivePort _responses;
// ···
  Worker3._(this._responses, this._commands) {
    _responses.listen(_handleResponsesFromIsolate);
  }
  static void _startRemoteIsolate(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);
  _handleCommandsToIsolate(receivePort, sendPort);
}
  }
static void _handleCommandsToIsolate(
    ReceivePort receivePort, SendPort sendPort) {
  receivePort.listen((message) {
    try {
      final jsonData = jsonDecode(message as String);
      sendPort.send(jsonData);
    } catch (e) {
      sendPort.send(RemoteError(e.toString(), ''));
    }
  });
}
void _handleResponsesFromIsolate(dynamic message) {
  if (message is RemoteError) {
    throw message;
  } else {
    print(message);
  }
}
Future<Object?> parseJson(String message) async {
  _commands.send(message);
}
class Worker4 {
  final SendPort _commands;
  final ReceivePort _responses;
  final Map<int, Completer<Object?>> _activeRequests = {};
  int _idCounter = 0;
Future<Object?> parseJson(String message) async {
  final completer = Completer<Object?>.sync();
  final id = _idCounter++;
  _activeRequests[id] = completer;
  _commands.send((id, message));
  return await completer.future;
}
static void _handleCommandsToIsolate(
    ReceivePort receivePort, SendPort sendPort) {
  receivePort.listen((message) {
    final (int id, String jsonText) = message as (int, String); 
    try {
      final jsonData = jsonDecode(jsonText);
      sendPort.send((id, jsonData)); 
    } catch (e) {
      sendPort.send((id, RemoteError(e.toString(), '')));
    }
  });
}
void _handleResponsesFromIsolate(dynamic message) {
  final (int id, Object? response) = message as (int, Object?); 
  final completer = _activeRequests.remove(id)!; 

  if (response is RemoteError) {
    completer.completeError(response); 
  } else {
    completer.complete(response); 
  }
}
}
class Worker5 {
  bool _closed = false;
// ···
  void close() {
    if (!_closed) {
      _closed = true;
      _commands.send('shutdown');
      if (_activeRequests.isEmpty) _responses.close();
      print('--- port closed --- ');
    }
  }
  static void _handleCommandsToIsolate(
  ReceivePort receivePort,
  SendPort sendPort,
) {
  receivePort.listen((message) {
    
    if (message == 'shutdown') {
      receivePort.close();
      return;
    }
    final (int id, String jsonText) = message as (int, String);
    try {
      final jsonData = jsonDecode(jsonText);
      sendPort.send((id, jsonData));
    } catch (e) {
      sendPort.send((id, RemoteError(e.toString(), '')));
    }
  });
}
Future<Object?> parseJson(String message) async {
  if (_closed) throw StateError('Closed'); // New
  final completer = Completer<Object?>.sync();
  final id = _idCounter++;
  _activeRequests[id] = completer;
  _commands.send((id, message));
  return await completer.future;
}
}