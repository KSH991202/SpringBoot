package com.study03.exam03.controller;

import java.util.Date;
import java.text.SimpleDateFormat;

public class TestApp {
    static String str1 = "Exam";
    static String str2 = "jsp";
    public static void main(String[] args) {

        Date today = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String todayStr = dateFormat.format(today);
        System.out.println("<h1>오늘날짜 : " + todayStr + "</h1>");

    }
}
