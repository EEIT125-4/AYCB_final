package blog;

public class practice {
	public static void main(String args[]){
		for(int i=0;i<5;i++){
			for(int j=4;j>i;j--){
			System.out.print(" ");
			}
			for(int j=0;j<2*i+1;j++){
			System.out.print("*");
			}
			System.out.println();
			}
			for(int i=0;i<5;i++){
			for(int j=0;j<=i;j++){
			System.out.print(" ");
			}
			for(int j=8;j>i*2+1;j--){
			System.out.print("*");
			}
			   System.out.println();
			}
	}}
		
//		for(int i=1;i<=9;i++) {
//			for(int j=1;j<i;j++)
//				System.out.println(i+"x"+j+"="+i*j);
//		}
//	}
//
//}


