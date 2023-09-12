void main()
{
  Collge obj=new Collge();
  obj.name='Raj';
  obj.rollNo=2;
  obj.student();
}

class Collge{

  String name='Rajendra';
  int rollNo=1;

  student(){
    print("student ${name}  ${rollNo}");
  }
}