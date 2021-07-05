class Reserve implements Runnable
{
	int available =1;
	int wanted;	

	Reserve(int i)
	{
	wanted = i;
	}

	public void run()
	{
		
	synchronized(this)
	{
		System.out.println("Available berths  = " + available);
		if (available >= wanted)
		{	
			String name = Thread.currentThread().getName();
					
			System.out.println(wanted + " Berth reserved for  " + name);
			try
			{
			Thread.sleep(1500);
			available = available - wanted;
			}
			catch(InterruptedException ie){}
		}
		else System.out.println("Sorry, no berths ");
	} 
	}
}

class SychronizedTrain
{
public static void main(String args[])
{
Reserve obj = new Reserve(1);
Thread t1 = new Thread(obj);
Thread t2 = new Thread (obj);
t1.setName("Shivani");
t2.setName("Bhavana");
t1.start();
t2.start();

}
}