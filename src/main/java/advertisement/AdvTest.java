package advertisement;

public class AdvTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		String linkString="<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/S7zJl2cWFMU\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>";
		System.out.println(linkString);
		int width=300,height=300;
		String mark="?mute=1&autoplay=1";
		
		String params[]=linkString.split(" ");
		String result="";
		System.out.println("length="+params.length);
		for(int i=0;i<params.length;i++) {
			if(i==1) {
				params[i]="width=\""+width+"\"";
			}
			if(i==2) {
				params[i]="height=\""+height+"\"";
			}
			if(i==3) {
				params[i]=params[i].substring(0,params[i].length()-1)+mark+"\"";
			}
//			System.out.println("param:"+i+" "+params[i]);
			result+=params[i]+" ";
			System.out.println(result);
		}
		System.out.println("result:\n"+result);
		
		
	}
	
	

}
