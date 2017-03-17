package com.bruceTim.core.util;

import com.bruceTim.web.model.User;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * Created by BruceTim on 2016/11/16.
 */
public class PasswordHelper {

    private static RandomNumberGenerator randomNumberGenerator =
            new SecureRandomNumberGenerator();
    public static String algorithmName_MD5 = "md5";
    public static String algorithmName_SHA1 = "SHA1";
    public static String algorithmName_SHA256 = "SHA256";

    /**
     * EncryptPassword
     * @param user
     * @param algorithmName algorithmName_MD5/algorithmName_SHA1/algorithmName_SHA256
     * @param hashIterations
     */
    public static void encryptPassword(User user, String algorithmName, int hashIterations) {
        user.setSalt(randomNumberGenerator.nextBytes().toHex());
        String newPassword = new SimpleHash(
                algorithmName,
                user.getPassword(),
                ByteSource.Util.bytes(user.getSalt()),
                hashIterations).toHex();
        user.setPassword(newPassword);
    }


    /**
     * Auth Password
     * @param user
     * @param algorithmName algorithmName_MD5/algorithmName_SHA1/algorithmName_SHA256
     * @param hashIterations
     */
    public static User changePassword(User user, String algorithmName, int hashIterations) {
        String newPassword = new SimpleHash(
                algorithmName,
                user.getPassword(),
                ByteSource.Util.bytes(user.getSalt()),
                hashIterations).toHex();
        user.setPassword(newPassword);
        return user;
    }

    /**
     * Auth Password
     * @param user
     * @param algorithmName algorithmName_MD5/algorithmName_SHA1/algorithmName_SHA256
     * @param hashIterations
     */
    public static boolean authPassword(User user, String algorithmName, int hashIterations, String password) {
        String newPassword = new SimpleHash(
                algorithmName,
                password,
                ByteSource.Util.bytes(user.getSalt()),
                hashIterations).toHex();
        return user.getPassword().equals(newPassword);
    }

}
