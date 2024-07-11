void main(List<String> args) {
  var dizi = List.filled(1, 0);

  var list2 = [0, 6, 7, 8, 9];
  var list3 = [6, 7, 8, 9];
  var list1 = [
    [1, 2],
    [3, 4]
  ];
  var listem = <int>[...list2, ...list3];
  var mySet = Set.from(list2);
  mySet = {...mySet, ...list3};
  
  var myMap = <String, dynamic>{"il": "ankara"};

  var iller = [
    {"ilAdi": "Ankara", "ilceSayisi": 10, "plaka": 6},
    {"ilAdi": "Ank", "ilceSayisi": 1, "plaka": 5},
    {"ilAdi": "ara", "ilceSayisi": 0, "plaka": 4},
  ];
  for (var ilBililer in iller) {
    for (var item in ilBililer.entries) {
      print(item.value);
    }
    print('###');
  }
}
