package com.terran.boilerplate.converters;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import com.terran.boilerplate.utils.CommonUtil.YesNoEnum;

@Converter(autoApply = true)
public class YesNoEnumConverter implements AttributeConverter<YesNoEnum, String> {

    @Override
    public String convertToDatabaseColumn(YesNoEnum attribute) {
        if(attribute != null) {
            return attribute.getCode();
        } else {
            return null;
        }
    }

    @Override
    public YesNoEnum convertToEntityAttribute(String dbData) {
        YesNoEnum yesNoObj = null;
        if (dbData == null || dbData.isEmpty()) {
            return null;
        }

        for (YesNoEnum item : YesNoEnum.values()) {
            if (dbData != null && item.getCode().compareTo(dbData) == 0) {
                yesNoObj = item;
                break;
            }
        }
        return yesNoObj;
    }

}
