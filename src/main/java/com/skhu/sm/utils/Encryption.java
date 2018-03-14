package com.skhu.sm.utils;

import java.security.MessageDigest;

/**
 * Created by ds on 2017-10-31.
 */
public class Encryption {

    public static final String SHA256 = "SHA=256";
    public static final String MD5 = "MD5";

    public static String encrypt(String s, String messageDigest) {
        try {
            MessageDigest md = MessageDigest.getInstance(messageDigest);
            md.reset();
            byte[] digested = md.digest(s.getBytes());
            StringBuffer sb = new StringBuffer();
            for(int i = 0; i < digested.length; i++) {
                sb.append(Integer.toHexString(0xff & digested[i]));
            }
            return sb.toString();
        }catch (Exception e) {
            return s;
        }
    }
}
