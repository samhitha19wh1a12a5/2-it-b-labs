import java.util.Scanner;  
class area_circumference{  
public static void main(String[] args)   
{  
Scanner sc=new Scanner(System.in);  
System.out.print("Enter a radius of the circle : ");   
float r = sc.nextFloat(); 
double area, circumference, pi=3.14;
area = pi*r*r;
circumference = 2*(pi)*r;
System.out.println("Area of the circle is : "+area);
System.out.println("Circumference of circle is : "+ circumference);  
}  
}
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
