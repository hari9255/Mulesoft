package util;

public class Utils {
	public static String  getDocumentType(String str) {
		if(str.equals("NationalId")) return "LegalDocument";
		return "Other";
	}
}
