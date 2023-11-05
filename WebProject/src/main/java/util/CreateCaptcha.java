package Util;

import java.util.Random;

public class CreateCaptcha {

    public static String captcha() {
        Random rd = new Random();
        String result = "";
        for (int i = 0; i < 6; i++) {
            result += rd.nextInt(10) + "";
        }
        return result;
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            System.out.println(captcha());
        }

    }

}
