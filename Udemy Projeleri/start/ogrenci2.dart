class Ogrenci {
  int _id;
  String _adi;
  Ogrenci(this._adi,this._id);
  @override
  String toString() {
    return "Öğrencinin numrarası $_id, adı $_adi'dir";
  }
}