package format;

import lombok.Getter;

@Getter
public enum RequestFormat {

    ACCOUNT_CREATE_FORMAT("inputData/request/AccountCreate.json"),
    ACCOUNT_TOKEN_FORMAT("inputData/request/AccountToken.json"),
    ACCOUNT_BOOKS_FORMAT("inputData/request/AddAccountBooks.json");


    private final String resourcePath;

    RequestFormat(String resourcePath) {
        this.resourcePath = resourcePath;
    }

    public static String getPathForRequestFormat(RequestFormat requestFormat) {
        return "src/test/resources/" + requestFormat.resourcePath;
    }
}
