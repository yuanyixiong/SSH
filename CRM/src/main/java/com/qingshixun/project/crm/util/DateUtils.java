/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 时间util 类
 * 
 * @author QingShiXun
 * @version 1.0
 */
public class DateUtils {

    private static Log log = LogFactory.getLog(DateUtils.class);

    public final static String DEFAULT_MONTH_PATTERN = "yyyy-MM";

    public final static String DEFAULT_DATE_PATTERN = "yyyy-MM-dd";

    public final static String DEFAULT_DATETIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

    public static Date getSysDateNoPattern() {
        return new Date(System.currentTimeMillis());
    }

    public static Timestamp getSysTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }

    public static Date getSysDate() {
        return stringToDate(getSysDateTimeString(), DEFAULT_DATE_PATTERN);
    }

    public static Date getSysDateTime() {
        return stringToDate(getSysDateTimeString(), DEFAULT_DATETIME_PATTERN);
    }

    public static Date getSysDate(String pattern) {
        return stringToDate(getSysDateTimeString(), pattern);
    }

    public static String getSysDateString() {
        return dateToString(getSysDateNoPattern(), DEFAULT_DATE_PATTERN);
    }

    public static String getSysDateString(String pattern) {
        return dateToString(getSysDateNoPattern(), pattern);
    }

    public static String getSysDateTimeString() {
        return dateToString(getSysDateNoPattern(), DEFAULT_DATETIME_PATTERN);
    }

    public static String getSysDateTimeString(String pattern) {
        return dateToString(getSysDateNoPattern(), pattern);
    }

    public static final String dateToString(Date date) {
        return dateToString(date, DEFAULT_DATE_PATTERN);
    }

    public static final String timeToString(Date date) {
        return dateToString(date, DEFAULT_DATETIME_PATTERN);
    }

    public static final String dateToString(Date date, String pattern) {
        return new SimpleDateFormat(pattern).format(date);
    }

    public static final Date stringToDate(String dateStr) {
        return stringToDate(dateStr, DEFAULT_DATE_PATTERN);
    }

    public static final Date stringToDateTime(String dateStr) {
        return stringToDate(dateStr, DEFAULT_DATETIME_PATTERN);
    }

    public static final Date getSysDateNoTime() {
        String datestr = dateToString(getSysDateNoPattern(), DEFAULT_DATE_PATTERN);
        return stringToDate(datestr, DEFAULT_DATE_PATTERN);
    }

    public static final Date stringToDate(String dateStr, String pattern) {
        try {
            return new SimpleDateFormat(pattern).parse(dateStr);
        } catch (ParseException e) {
            log.error(e.getMessage(), e);
            throw new RuntimeException(e);
        }
    }
}
