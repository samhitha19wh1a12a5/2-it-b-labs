import java.util.Scanner;  
import static java.lang.Math.pow;
class interest 
{  
public static void main(String[] args)   
{  
Scanner sc=new Scanner(System.in);  
System.out.print("Enter the principal ammount : ");   
double p = sc.nextDouble();
System.out.print("Enter the rate : ");   
double r = sc.nextDouble();
System.out.print("Enter the time : ");   
int t = sc.nextInt();
System.out.print("Enter a number of times intrest is compounded : ");   
int n = sc.nextInt();
double si = (p*t*r)/100;
double ci =(p*(Math.pow(1+r/100, t)))-p;
System.out.println("Simple intrest : "+ si);
System.out.println("Compound intrest : " + ci);  
}  
}  