package objectData;

import lombok.Data;

import java.util.HashMap;

@Data
public class RequestTokenObject extends RequestObject {

    private String userName;
    private String password;

    public RequestTokenObject(HashMap<String, String> testData){
        prepareData(testData);
    }

    private void prepareData(HashMap<String, String> testData){
        for (String key: testData.keySet()){
            switch (key){
                case "userName":
                    setUserName(testData.get(key));
                    break;
                case "password":
                    setPassword(testData.get(key));
                    break;
            }
        }
        prepareUserName(testData);
    }

    private void prepareUserName(HashMap<String, String> testData){
        String userName = testData.get("userName");
        userName = userName + System.currentTimeMillis();
        setUserName(userName);
    }
}
