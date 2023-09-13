void main()
{
  int x=12;
  int y=0;

  try{
    int res=x~/y;
    print(res);
  }
  catch(e)
  {
    print(e);
    y=4;
    int res=x~/y;
    print(res);
  }
}