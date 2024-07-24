/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.formatters;
import com.hat.pojos.DanhMuc;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author AnhTuan
 */
public class DanhMucFormatter implements Formatter<DanhMuc>{

    @Override
    public String print(DanhMuc t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public DanhMuc parse(String id, Locale locale) throws ParseException {
        DanhMuc c = new DanhMuc();
        c.setId(Integer.parseInt(id));
        
        return c;
    }
    
}
