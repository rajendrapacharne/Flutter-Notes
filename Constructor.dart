void main()
{
  Collge obj=new Collge();
  obj.name='Raj';
  obj.rollNo=2;
  obj.student('abc',3);
}

class Collge{

  String name='Rajendra';
  int rollNo=1;

  student(String name, int rollNo){
    this.name=name;
    this.rollNo=rollNo;
    print("student ${name}  ${rollNo}");
  }
}