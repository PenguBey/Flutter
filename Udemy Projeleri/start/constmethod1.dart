class CemberDaire {
  late double _yaricap;
  double _pi = 3.14;
  CemberDaire(double yaricap) {
    yariCapEkle = yaricap;
  }

  void set yariCapEkle(double yaricap) {
    if (yaricap <= 0) {
     
      throw ArgumentError('Yarıçap  0\'dan büyük olmalıdır');
    }

    _yaricap = yaricap;
  }

  String get sonuc {
    return "sonucunuz ${_yaricap* _yaricap * _pi}";
  }
}
