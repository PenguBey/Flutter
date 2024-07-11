void main(List<String> args) {
  Kisi efe = Calisan("11", 2, 33);
  print(efe.kendiniTanit);
}
class Kisi {
  String ad;
  int yas;
  Kisi(this.ad,this.yas);
  String get kendiniTanit {
    return "Merhaba ben ${ad} ve ${yas} yaşındayım";
  }
}

class Calisan extends Kisi{
  int maas;
  Calisan(super.ad,super.yas, this.maas);
  @override
  String get kendiniTanit => super.kendiniTanit + " $maas kazanıyorum";
}