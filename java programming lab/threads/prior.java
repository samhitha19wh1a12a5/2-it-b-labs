class MyClass extends Thread
{
	int count = 0;
	public void run()
	{
		for(int i = 1; i<=1000; i++)
		count++;	
		System.out.println("completed Thread : " + Thread.currentThread().getName());
		System.out.println("Its Priority :" + Thread.currentThread().getPriority());
	}
}

class Prior
{
public static void main(String args[])
{
	MyClass obj = new MyClass();
	Thread t1 = new Thread(obj, "First");
	Thread t2 = new Thread(obj, "Second");
	
	t1.setPriority(2);
	t2.setPriority(Thread.NORM_PRIORITY); //This means priority no is 5

	t1.start();
	t2.start();
}
}