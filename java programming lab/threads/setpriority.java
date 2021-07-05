class A extends Thread
{
public void run()
{
for (int j=0;j<=5;j++)
{
System.out.println("Thread A =" + j);
}
System.out.println("End of Thread A");
}
}

class B extends Thread
{
public void run()
{
for (int j=0;j<=5;j++)
{
System.out.println("Thread B =" + j);
}
System.out.println("End of Thread B");
}
}


class SetPriority
{
public static void main(String args[])
{
A a = new A();
B b = new B();

a.setPriority(Thread.MAX_PRIORITY);
b.setPriority(Thread.MIN_PRIORITY);

a.start();
b.start();

System.out.println(" Main Thread--Hello");
}
}