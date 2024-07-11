
void main(List<String> args) {
  print("###");
  int? ycap = null;
  int kontrol = ycap ?? 0;// null kontrolu
  print(daireAlan(3.14, yaricap: kontrol));

  print("###");
}
/*Fat Arrow method */
String daireAlan(double pi, {int yaricap = 0}) =>/*ternary (kısa if)*/ (hesapla(yaricap, pi) != 0)
    ? hesapla(yaricap, pi).toString()
    : "YarıÇap Girmediniz";

double hesapla(int yaricap, double pi) => (yaricap * yaricap * pi);