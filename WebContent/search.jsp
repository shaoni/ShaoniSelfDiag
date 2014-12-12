<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Self-Diagnosis</title>
  </head>
    
  <body>
  <% 
   String q1 = (String)request.getAttribute("search_query"); 
   %>
   <input type="hidden" name="query" id="q_id" value=<%= (String)request.getAttribute("search_query")%> ></input>
    <div id="searchcontrol">Loading</div>
  </body>
    
    
    
    <script src="https://www.google.com/jsapi"
        type="text/javascript"></script>
    <script language="Javascript" type="text/javascript">
    //<!
    google.load('search', '1');
    

    function OnLoad() {
      // Create a search control
      var searchControl = new google.search.SearchControl();

      // Add in a full set of searchers
      var localSearch = new google.search.LocalSearch();
      searchControl.addSearcher(localSearch);
      searchControl.addSearcher(new google.search.WebSearch());
      searchControl.addSearcher(new google.search.VideoSearch());
      searchControl.addSearcher(new google.search.BlogSearch());
      searchControl.addSearcher(new google.search.NewsSearch());
      searchControl.addSearcher(new google.search.ImageSearch());
      searchControl.addSearcher(new google.search.BookSearch());
      searchControl.addSearcher(new google.search.PatentSearch());

      // Set the Local Search center point
      localSearch.setCenterPoint("Seattle, WA");

      // tell the searcher to draw itself and tell it where to attach
      searchControl.draw(document.getElementById("searchcontrol"));
	  
      var q = document.getElementById("q_id").value;
      
      // execute an inital search
      searchControl.execute(q);
    }
    google.setOnLoadCallback(OnLoad);
    
    
 // establish a keep callback
    searchControl.setOnKeepCallback(this, MyKeepHandler);

    function MyKeepHandler(result) {
      // clone the result html node
      var node = result.html.cloneNode(true);

      // attach it
      var savedResults = document.getElementById("saved_results");
      savedResults.appendChild(node);
    }

    //]]>
    </script>
</html>