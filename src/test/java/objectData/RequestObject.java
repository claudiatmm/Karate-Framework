package objectData;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import format.RequestFormat;
import lombok.SneakyThrows;
import java.io.File;
import java.util.HashMap;

public class RequestObject {

    @SneakyThrows
    public static RequestObject prepareRequestObject(String requestBodyType) {
        switch (requestBodyType) {
            case "ACCOUNT_CREATE_FORMAT":
                return createRequestObject(RequestFormat.ACCOUNT_CREATE_FORMAT, RequestAccountObject.class);
            case "ACCOUNT_TOKEN_FORMAT":
                return createRequestObject(RequestFormat.ACCOUNT_TOKEN_FORMAT, RequestTokenObject.class);
            default:
                return null;
        }
    }

    @SneakyThrows
    private static <T extends RequestObject> T createRequestObject(RequestFormat format, Class<T> clazz) {
        ObjectMapper objectMapper = new ObjectMapper();
        String pathFile = RequestFormat.getPathForRequestFormat(format);
        HashMap<String, String> testData = objectMapper.readValue(new File(pathFile), new TypeReference<>() {});
        return clazz.getConstructor(HashMap.class).newInstance(testData);
    }
}
