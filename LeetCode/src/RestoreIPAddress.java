// https://leetcode.com/problems/restore-ip-addresses/

import java.util.ArrayList;
import java.util.List;

public class RestoreIPAddress {
    private List<String> result = new ArrayList<>();

    private boolean isValidIPComponent(String s) {
        if (s.length() > 1 && s.charAt(0) == '0') {
            return false;
        }

        try {
            int val = Integer.parseInt(s);
            return 0 <= val && val <= 255;
        } catch (Exception e) {
            return false;
        }
    }

    private String createIP(List<String> currentIP, String separator) {
        if (currentIP.size() != 4) return "";

        StringBuilder result = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            result.append(currentIP.get(i));
            if (i < 3) result.append(separator);
        }

        return result.toString();
    }

    private void getParts(int start, String s, List<String> currentIP) {
        if (currentIP.size() == 4) {
            if (start == s.length()) {
                result.add(createIP(currentIP, "."));
            }
            return;
        }
        for (int i = start; i < start + 3 && i < s.length() - (3 - currentIP.size()); i++) {
            if (isValidIPComponent(s.substring(start, i + 1))) {
                currentIP.add(s.substring(start, i + 1));
                getParts(i + 1, s, currentIP);
                currentIP.remove(currentIP.size() - 1);
            }
        }
    }

    public List<String> restoreIpAddresses(String s) {
        getParts(0, s, new ArrayList<>());
        return result;
    }

    public static void main(String [] args) {
        System.out.println(new RestoreIPAddress().restoreIpAddresses("010010"));
    }
}
