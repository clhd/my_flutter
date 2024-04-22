void main() {
  var list = [1, 2, 3];
  var list1 = [
    'Car',
    'Boat',
    'Plane',
  ];
  var list3 = [1, 2, 3];
  assert(list3.length == 3);
  assert(list3[1] == 2);

  list3[1] = 1;
  assert(list3[1] == 1);
  var constantList = const [1, 2, 3];
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'}; //集合
  var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);
  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  //哈希表
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  var gifts1 = Map<String, String>();
  gifts1['first'] = 'partridge';
  gifts1['second'] = 'turtledoves';
  gifts1['fifth'] = 'golden rings';

  var nobleGases1 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  var gifts2 = {'first': 'partridge'};
  gifts2['fourth'] = 'calling birds'; // 添加新的键值对

  var gifts3 = {'first': 'partridge'};
  assert(gifts3['first'] == 'partridge');

  assert(gifts3['fifth'] == null);
  gifts3['fourth'] = 'calling birds';
  assert(gifts3.length == 2);
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  var list4 = [1, 2, 3];
  var list2 = [0, ...list];
  assert(list2.length == 4);
// var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
// var nav = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
}
