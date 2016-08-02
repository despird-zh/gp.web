package gp.core;

import com.gp.web.util.ExcerptUtils;

/**
 * Created by garydiao on 8/1/16.
 */
public class ExcerptParserTest {

    public static void main(String[] args){

        String hcode  = "<p>please remind of following things<br></p><ol><li>submit letter template to alvado</li><li>delete table redundant field</li><li>truncate the table<br></li></ol>\n" +
                "<img src=\"data:image/gif;base64,R0lGODlhDwAPAKECAAAAzMzM/////  \n" +
                "wAAACwAAAAADwAPAAACIISPeQHsrZ5ModrLlN48CXF8m2iQ3YmmKqVlRtW4ML  \n" +
                "wWACH+H09wdGltaXplZCBieSBVbGVhZCBTbWFydFNhdmVyIQAAOw==\"  \n" +
                "alt=\"Base64 encoded image\" width=\"150\" height=\"150\"/>\n" +
                "<img src=\"data:image/gif;base64,R0lGODlhDwAPAKECAAAAzMzM/////  \n" +
                "wAAACwAAAAADwAPAAACIISPeQHsrZ5ModrLlN48CXF8m2iQ3YmmKqVlRtW4ML  \n" +
                "wWACH+H09wdGltaXplZCBieSBVbGVhZCBTbWFydFNhdmVyIQAAOw==\"  \n" +
                "alt=\"Base64 encoded image\" width=\"150\" height=\"150\"/> ";

        ExcerptUtils.getExcerptCode(hcode);
    }
}
