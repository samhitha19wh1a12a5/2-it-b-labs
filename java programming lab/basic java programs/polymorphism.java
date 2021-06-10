class poly{
int fun(int a, int b){
return a+b;
}
}
class poly1 extends poly{
int fun(int a,int b){
return a+b;
}
}
class polymorphism{
public static void main(String[] args){
poly p = new poly1();
System.out.println("Sum : " +p.fun(10,20));
}
}