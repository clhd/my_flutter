class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }

  set contrast(int value) {}
  
  void _illuminateDisplay() {}
  
  void _activateIrSensor() {}
  // ···
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
  //重写方法声明必须匹配 它以多种方式重写的方法（或方法）：

// 返回类型必须与（或子类型）相同 重写的方法的返回类型。
// 参数类型必须与（或超类型）相同 重写的方法的参数类型。 在前面的示例中，setter 将参数类型从更改为超类型 。contrastSmartTelevisionintnum
// 如果重写的方法接受 n 个位置参数， 然后，覆盖方法还必须接受 n 个位置参数。
// 泛型方法不能覆盖非泛型方法， 非泛型方法不能覆盖泛型方法。
  @override
  set contrast(num value) {}
  
  void _bootNetworkInterface() {}
  
  void _initializeMemory() {}
  
  void _upgradeApps() {}
  // ···
}
class A {

  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: '
        '${invocation.memberName}');
  }
}
