package com.sz.site7road.framework.converter;

import org.springframework.beans.PropertyEditorRegistrar;
import org.springframework.beans.PropertyEditorRegistry;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConvert implements PropertyEditorRegistrar {
    @Override
	public void registerCustomEditors(PropertyEditorRegistry registry) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		registry.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
	}
}
