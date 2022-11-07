/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CustomTag;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 *
 * @author win
 */
public class Custom_Tag extends SimpleTagSupport{
    public void doCustomTag() throws JspException, IOException{
        JspWriter out = getJspContext().getOut();
        out.println("Hellp CusTom Tag");
    }
}
