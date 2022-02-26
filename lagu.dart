import 'dart:io';

void main() {

  stdout.write('Masukkan jumlah anak ayam : ');
  var ayam = stdin.readLineSync();
  int AYAM = int.parse('$ayam');

  print('anak ayam turun $ayam');
  for(var i=AYAM; i>0; i--)
  {
    var sisa = i - 1;
    if(i == 1)
    {
      print('anak ayam turun $i, mati satu tinggal induknya');
    }else{
      print('anak ayam turun $i, mati satu tinggal $sisa');
    }
  }

}