package cn.domarvel.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtils {
    private static SimpleDateFormat enDateFormate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

    public static String getEnTime(Date date){
        return enDateFormate.format(date);
    }
}
