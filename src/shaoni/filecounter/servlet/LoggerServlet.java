package shaoni.filecounter.servlet;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class LoggerServlet extends HttpServlet {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException {
	
	String q = (String)req.getParameter("search_query");
	
	final Logger logger = Logger.getLogger(LoggerServlet.class);
	logger.info("Query: " +q +"\n");
	resp.setContentType("text/html");
	req.setAttribute("search_query", q);
	
	String google = "http://www.google.com/search?q=";
	String search = q;// search_query
	String charset = "UTF-8";
	String userAgent = "ExampleBot 1.0 (+http://example.com/bot)"; // Change this to your company's name and bot homepage!

	Elements links = Jsoup.connect(google + URLEncoder.encode(search, charset)).userAgent(userAgent).get().select("li.g>h3>a");
	
	for (Element link : links) {
	    String title = link.text();
	    String url = link.absUrl("href"); // Google returns URLs in format "http://www.google.com/url?q=<url>&sa=U&ei=<someKey>".
	    url = URLDecoder.decode(url.substring(url.indexOf('=') + 1, url.indexOf('&')), "UTF-8");

	    if (!url.startsWith("http")) {
	        continue; // Ads/news/etc.
	    }
	    
	    logger.info("Title: " + title + " \n" 
	    			+ "     URL: " + url + "\n");
	}
  
	String nextJSP = "/search.jsp";
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
	dispatcher.forward(req,resp);
//	resp.getWriter().write(q);
	
	
	
}
}