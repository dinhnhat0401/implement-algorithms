import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class CallAPI {
  public int makeRequest(int n, String seed) throws IOException {
    // implement calling server here!
    URL serverUrl =
        new URL("https://API-API/ask?n=" + n + "&seed="+ seed);
    HttpURLConnection urlConnection = (HttpURLConnection)serverUrl.openConnection();

    urlConnection.setRequestMethod("GET");

    // Reading from the HTTP response body
    Scanner httpResponseScanner = new Scanner(urlConnection.getInputStream());
    if(httpResponseScanner.hasNextLine()) {
      String response = httpResponseScanner.nextLine();
      // This is tricky method to parse a JSON response without any libs
      String[] arrOfStr = response.split("\"result\":");
      if (arrOfStr.length < 2) return -1;
      return Integer.parseInt(arrOfStr[1].substring(0, arrOfStr[1].length() - 1));
    }
    httpResponseScanner.close();
    return -1;
  }
}
