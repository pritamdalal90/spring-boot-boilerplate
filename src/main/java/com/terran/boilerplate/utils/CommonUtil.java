package com.terran.boilerplate.utils;

public class CommonUtil {

    public static enum YesNoEnum {

        YES("1"), NO("0");

        private final String code;

        private YesNoEnum(String code) {
            this.code = code;
        }

        public String getCode() {
            return code;
        }

    }
}

