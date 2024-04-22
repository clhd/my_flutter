void main() {
  int a;
  int b;

  a = 0;
  b = ++a;
  assert(a == b);

  a = 0;
  b = a++;
  assert(a != b); // 1 != 0

  a = 0;
  b = --a;
  assert(a == b); // -1 == -1

  a = 0;
  b = a--;
  assert(a != b); // -1 != 0
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);
  var employee;
  (employee as Person).firstName = 'Bob';
  if (employee is Person) {
    //类型检查
    employee.firstName = 'Bob';
  }
  var a1 = 2;
  a1 *= 3;
  assert(a1 == 6);
  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02);
  assert((value & ~bitmask) == 0x20);
  assert((value | bitmask) == 0x2f);
  assert((value ^ bitmask) == 0x2d);

  assert((value << 4) == 0x220);
  assert((value >> 4) == 0x02);

  assert((-value >> 4) == -0x03);

  assert((value >>> 4) == 0x02);
  assert((-value >>> 4) > 0);
  var isPublic;
  var visibility = isPublic ? 'public' : 'private';
  String playerName(String? name) => name ?? 'Guest';
  // Slightly longer version uses ?: operator.
  String playerName1(String? name) => name != null ? name : 'Guest';

// Very long version uses if-else statement.
  String playerName2(String? name) {
    if (name != null) {
      return name;
    } else {
      return 'Guest';
    }
  }

  var Colors;
  var paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

  var window;
  querySelector('#confirm') // Get an object.
    ?..text = 'Confirm' // Use its members.
    ..classes.add('important')
    ..onClick.listen((e) => window.alert('Confirmed!'))
    ..scrollIntoView();

  var button = querySelector('#confirm');
  button?.text = 'Confirm';
  button?.classes.add('important');
  button?.onClick.listen((e) => window.alert('Confirmed!'));
  button?.scrollIntoView();
  final addressBook = (AddressBookBuilder()
      ..name = 'jenny'
      ..email = 'jenny@example.com'
      ..phone = (PhoneNumberBuilder()
            ..number = '415-555-0100'
            ..label = 'home')
          .build())
    .build();
}

class PhoneNumberBuilder {
  set label(String label) {}

  set number(String number) {}
  
  build() {}
}

class AddressBookBuilder {
  set name(String name) {}

  set email(String email) {}

  set phone(phone) {}
  
  build() {}
}

querySelector(String s) {}

class StrokeCap {
  static var round;
}

class Paint {
  set strokeWidth(double strokeWidth) {}

  set strokeCap(strokeCap) {}

  set color(color) {}
}

class Person {
  late String firstName;
}
