import java.util.Random;

class RandomNumberThread extends Thread {
	public void run() {
		Random random = new Random();
		for (int i = 0; i < 15; i++) {
			int randomInt = random.nextInt(100);
			System.out.println("Generated Random Integer : " + randomInt);
			if((randomInt %2) == 0) {
				SquareThread sThread = new SquareThread(randomInt);
				sThread.start();
			}
			else {
				CubeThread cThread = new CubeThread(randomInt);
				cThread.start();
			}
			try {
				Thread.sleep(1000);
			} 
			catch (InterruptedException ex) {
				System.out.println(ex);
			}
		}
	}
}

class SquareThread extends Thread {
	int num;

	SquareThread(int randomNum) {
		num = randomNum;
	}

	public void run() {
		System.out.println("Square of " + num + " = " + (num * num));
	}
}

class CubeThread extends Thread {
	int num;

	CubeThread(int randomNum) {
		num = randomNum;
	}

	public void run() {
		System.out.println("Cube of " + num + " = " + num * num * num);
	}
}

public class MultiThreadingApplication {
	public static void main(String args[]) {
		RandomNumberThread rnThread = new RandomNumberThread();
		rnThread.start();
	}
}