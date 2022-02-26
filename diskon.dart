import 'dart:io';

void main() {
  stdout.write("Masukkan total belanja : ");
  var belanja = stdin.readLineSync();
  int BELANJA = int.parse('$belanja');
  
  stdout.write('ada kartu? ');
  var kartu = stdin.readLineSync();
  int KARTU = int.parse('$kartu');

  if(KARTU == 1)
  {
    if(BELANJA > 500){
      print('diskon = 50rb');
    }else if(BELANJA > 100){
      print('diskon = 15rb');
    }else{
      print('diskon = 0');
    }
  }
  else {
    if(BELANJA > 100){
      print('diskon = 5rb');
    }else{
    print('diskon 0');
    }
  }
}