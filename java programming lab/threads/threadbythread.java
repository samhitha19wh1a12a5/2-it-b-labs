class A extends Thread
{
public A(String s)
{
super(s);
}
public void run()
{
for (int i=0;i<=3;i++)
{
System.out.println(getName());
}
}
}

class ThreadbyThread
{
public static void main(String args[])
{
A a1 = new A("Shivani");
A a2 = new A ("Bhavana");
A a3 = new A ("Saisree");
a1.start();
a2.start();
a3.start();

System.out.println("Hello");

}
}