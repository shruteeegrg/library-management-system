package pkg1;

public class Utils {
	public boolean isNumeric(String str1) {
		boolean result = false;
		try {
			Integer.parseInt(str1);
			result=true;
		}
		catch(Exception ex) {
			result = false;
		}
		return result;
	}
}
