package cn.domarvel.utils;

import cn.domarvel.annotations.BeanPropertyErrorType;
import cn.domarvel.exception.SimpleException;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Administrator on 2017/8/24.
 */
public class BeanPropertyValidateUtils {
    /**
     * 这里面实现的是 对一个 Bean 属性的属性值进行校验，如果 null 或者空字符串，那么久抛出对应 BeanPropertyErrorType 的异常！
     */
    public static void validateIsEmptyProperty(Object target ,Field ...excepts) throws SimpleException {
        List<Field> allProperty = getAllProperty(target);
        for (Field field : allProperty) {
            field.setAccessible(true);//设置私有属性可访问
            BeanPropertyErrorType tempAnnotation = field.getAnnotation(BeanPropertyErrorType.class);
            if(tempAnnotation==null){//如果当前属性没有该注解，那么就表示，当前属性不在我们判断为空范围内！
                continue;
            }
            try {
                Object fieldValue = field.get(target);
                String value = ((String) fieldValue).trim();
                if(value == null || value.equals("")){

                    String errorType = tempAnnotation.value();
                    String propertyName = tempAnnotation.propertyName();

                    throw new SimpleException(errorType,propertyName+"不能为空！");
                }
                field.set(target,value);//当 value 被 trim 后的值
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 获取某个对象的所有属性Field对象。
     * @param target
     * @return
     */
    public static List<Field> getAllProperty(Object target){
        Class clazz = target.getClass();
        List<Field> fieldList = new LinkedList<>();
        while(clazz!=null){
            fieldList.addAll(Arrays.asList(clazz.getDeclaredFields()));
            clazz = clazz.getSuperclass();
        }
        return fieldList;
    }

    public static String validateStrIsEmpty(String targetStr , String propName) throws Exception{
        targetStr = targetStr.trim();
        if("".equals(targetStr)){
            throw new SimpleException(propName+" 不能为空！");
        }
        return targetStr;
    }
}
