package banana;

import java.io.IOException;

public class Util {
    public static String han( String a ) {
        try {
            byte[] bs = a.getBytes("8859_1");
            a = new String( bs, "utf-8" );
        }
        catch( IOException e ) {}
        return a;
    }
	public static String uploadDir() {
		String t = System.getProperty("os.name");
		String upload = "/pukyung18/upload/";
		if( t.indexOf("indows") != -1 ) {
			upload = "C:\\upload\\";
		}
		return upload;
	}
}
