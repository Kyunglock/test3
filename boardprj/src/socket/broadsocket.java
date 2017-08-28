package socket;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
 
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 
 
@ServerEndpoint("/broadsocket")
public class broadsocket {
    //유저 집합 리스트
    static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
     
    /**
     * 웹 소켓이 접속되면 유저리스트에 세션을 넣는다.
     * @param userSession 웹 소켓 세션
     */
    @OnOpen
    public void handleOpen(Session userSession) throws IOException{
    	System.out.println("client is now connected...");
    	sessionUsers.add(userSession);
        if(sessionUsers.size() ==2 ) {
    		System.out.println("게임을 시작합니다.");
    		sessionUsers.get(0).getBasicRemote().sendText(buildJsonData2("1플레이어 게임을 시작합니다!"));
    		sessionUsers.get(0).getBasicRemote().sendText(buildJsonData2("1개의 카드를 선택하세요"));
    		
    		sessionUsers.get(1).getBasicRemote().sendText(buildJsonData2("2플레이어 게임을 시작합니다!"));
    		sessionUsers.get(1).getBasicRemote().sendText(buildJsonData2("1개의 카드를 선택하세요"));
    	}
        if(sessionUsers.size() >=3) {
        	System.out.println("유저수를 초과했습니다.");
        	userSession.getBasicRemote().sendText(buildJsonData2("1"));
        	handleClose(userSession);
        }
     }
    /**
     * 웹 소켓으로부터 메시지가 오면 호출한다.
     * @param message 메시지
     * @param userSession
     * @throws IOException
     */
    @OnMessage
    public void handleMessage(String message,Session userSession) throws IOException{
        //세션 프로퍼티에 username이 없으면 username을 선언하고 해당 세션을으로 메시지를 보낸다.(json 형식이다.)
        //최초 메시지는 username설
    	String s[] = message.split("_");
    	for(int i =0; i<s.length; i++) {
    		System.out.println(s[i]);
    	}
    	
        sessionUsers.get(0).getBasicRemote().sendText(buildJsonData2(message));
		sessionUsers.get(1).getBasicRemote().sendText(buildJsonData2(message));
        //username이 있으면 전체에게 메시지를 보낸다.
        //카드뽑기 user 1, 2 둘다 볼 수 있는 것 하지만 1에겐 기능을 2에겐 보이는 기능만 구현
    }
    /**
     * 웹소켓을 닫으면 해당 유저를 유저리스트에서 뺀다.
     * @param userSession
     */
    @OnClose
    public void handleClose(Session userSession){
        System.out.println("client is now disconnected..");
    	sessionUsers.remove(userSession);
    }
    /**
     * json타입의 메시지 만들기
     * @param username
     * @param message
     * @return
     */
    public String buildJsonData(String username,String message){
        JsonObject jsonObject = Json.createObjectBuilder().add("message", username+" : "+message).build();
        StringWriter stringwriter =  new StringWriter();
        try(JsonWriter jsonWriter = Json.createWriter(stringwriter)){
                jsonWriter.write(jsonObject);
        };
        return stringwriter.toString();
    }
    public String buildJsonData2(String message){
        JsonObject jsonObject = Json.createObjectBuilder().add("message", message).build();
        StringWriter stringwriter =  new StringWriter();
        try(JsonWriter jsonWriter = Json.createWriter(stringwriter)){
                jsonWriter.write(jsonObject);
        };
        return stringwriter.toString();
    }
}