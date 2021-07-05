class Q{
int n;
boolean valueSet=false;
public synchronized void put(int n){
	while(valueSet){
		try{wait();}
		catch(InterruptedException e){}
	}
	System.out.println("Put : "+n);
	this.n=n;
	valueSet=true;
	notify();
}
public synchronized void get(){
	while(!valueSet){
	try{
		wait();
	}
	catch(InterruptedException e){}
	}
	System.out.println("Get : "+n);
	valueSet=false;
	notify();
}
}

class Producer implements Runnable{
Q q;
Producer(Q q){
	this.q=q;
	new Thread(this,"Producer").start();
}
public void run(){
	int i=0;
	while(true){
		q.put(i++);
		try{Thread.sleep(1000);}
		catch(Exception e){}
	}
}
}

class Consumer implements Runnable{
Q q;
Consumer(Q q){
	this.q=q;
	new Thread(this,"Consumer").start();
}
public void run(){
	while(true){
		q.get();
		try{Thread.sleep(1000);}
		catch(Exception e){}
	}
}
}

public class producerConsumer{
public static void main(String args[]){
	Q q = new Q();
	new Producer(q);
	new Consumer(q);
	System.out.println("press ctrl+c to stop");
}
}