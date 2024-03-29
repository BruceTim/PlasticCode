package com.bruceTim.core.generic;

/**
 * 所有自定义枚举类型实现该接口
 * 
 * @author StarZou
 * @since 2014年5月28日 上午10:07:20
 **/
public interface GenericEnum {

    /**
     * value: 为保存在数据库中的值
     */
    int getValue ();

    /**
     * text : 为前端显示值
     */
    String getText ();

}
