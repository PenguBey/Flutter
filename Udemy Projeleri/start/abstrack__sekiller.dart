import 'dart:collection';
import 'dart:ffi';

void main(List<String> args) {
  var dortgenler = [Kare(2), Dortgengen(2, 3)];
  for (var element in dortgenler) {
    print(element.alanHesapla().toString() + "alanım");
    print(element.cevreHesapla().toString() + "cevrem");
    print(element.tanimla());
    print('####');
  }
}

abstract class Sekil {
  double alanHesapla();
  double cevreHesapla();
  String tanimla() {
    return "ben bir şekilim";
  }
}

class Kare extends Sekil {
  int kenar;
  Kare(this.kenar);
  @override
  double alanHesapla() {
    return kenar * kenar.toDouble();
  }

  @override
  double cevreHesapla() {
    return kenar * 4.toDouble();
  }

  @override
  String tanimla() {
    return super.tanimla() + "ve kareyim";
  }
}

class Dortgengen extends Sekil {
  int kenar1;
  int kenar2;
  Dortgengen(this.kenar1, this.kenar2);
  @override
  double alanHesapla() {
    return kenar1 * kenar2.toDouble();
  }

  @override
  double cevreHesapla() {
    return kenar1 + kenar2 * 2.toDouble();
  }

  @override
  String tanimla() {
    return super.tanimla() + "ve dorgenim";
  }
}
