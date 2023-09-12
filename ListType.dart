void main() {
  
  List <int> first=[1,2,3,4,5];
  List second=['aa','bb','cc'];
  second.add('dd');
  second.add(123);
  second.remove('aa');
  print(second);
  
  print('');
  print('For Loop');
  print('');
  for(int i=0;i<second.length;i++)
  {
    print(second[i]);
  }
  print('');
  print('For Each Loop');
  print('');
  
  for(var i in second)
  {
     print(i);
  }
  

List third;
third=first.map((e) => e).toList();
print(third);


}
