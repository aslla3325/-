<%@ page contentType="text/plain; charset=utf-8"
    pageEncoding="EUC-KR"
    import="org.json.*"%><%
    
    String type = request.getParameter("type");
    
    String content = null;
    if( type != null ) {
    	if( type.equals("1") ) {
    		content = "�Ա� �ȳ� �帳�ϴ�. ������� 010-3344-5566 ���·� 0000���� �Ա��� �ּ���.\r\n\r\n"+
    			"�Աݽ� �Ա��� �̸� �ڿ� ���� �����ϴ� �ܾ �־��ֽø� ������ ������ �˴ϴ�.\r\n\r\n" +
    			"ȫ�浿 ����";
    	}
    	else if( type.equals("2") ) {
    		content = "�����ֽ� ������ �����մϴ�. ����� 0000�� �Դϴ�.";
    	}    	
    }

    JSONObject json = new JSONObject();    
    if( content != null ) {
    	json.put("success", true );
    	json.put("content", content );
    }
    else {
    	json.put("success", false ); 
    }
    out.print( json.toString() );
%>