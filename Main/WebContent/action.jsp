<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="myPackage.Summoner" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.google.gson.JsonParser"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.google.gson.JsonArray"%>
<%@ page import="java.sql.*" %>
<%@ page import="myPackage.Rank" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    background-color: #0080FF;
}
.image {
	text-align : center;
}
.soloinfo {
	float: left; 
	clear : both;
	background-color: #E1F5A9;
	width : 350px;
	height : 250x;
	border : 5px solid;
	margin: 7px;
	padding : 5px;
}
.freeinfo {
	float: left; 
	clear : both;
	background-color: #E1F5A9;
	width : 350px;
	height : 250x;
	border : 5px solid;
	margin: 7px;
	padding : 5px;
}
.summonername {
	background-color: #E1F5A9;
	width : 600px;
	border : 5px solid;
	margin: 7px;
	padding : 5px;
    text-align : center;
}
.ingamebox {
	float: left; 	
	background-color: #E1F5A9;
	width : 800px;
	height : 140px;
	border : 5px solid;
	margin: 7px;
	padding : 5px;
}
</style>
</head>
<body>
<div class = "image">
<a href = "main.jsp"><img  src = "./image/pic.png" width="550" height="350"></a>
</div>
<%
	try
 	{
		request.setCharacterEncoding("utf-8");
		String api = "RGAPI-9f7a9d29-5fc5-4cf1-82cf-85b784625ebf";
		
		Gson gson = new Gson();

		
		String Mainname = request.getParameter("id");
	
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+Mainname+"?api_key="+api;

		Document doc = Jsoup.connect(url).ignoreContentType(true).get();
	 
		String text = doc.text();
		
		System.out.println(text);
		
		JsonParser jsonParser = new JsonParser();
		
		JsonElement element = jsonParser.parse(text);
		
		String id = element.getAsJsonObject().get("id").getAsString();
		String name = element.getAsJsonObject().get("name").getAsString();
		String accountId = element.getAsJsonObject().get("accountId").getAsString();
		
		String league = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+id+"?api_key="+api;
		
		Document doc2 = Jsoup.connect(league).ignoreContentType(true).get();
		
		String text2 = doc2.text();
		
		System.out.println(text2);

		JsonArray jsonArray = (JsonArray) jsonParser.parse(text2);
	%>
		<div class = "summonername">
	  	 	 <h1>소환사 :<%=name%> 님</h1>
	  	</div>
	<%
		
		for(int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
			
			String tier = object.get("tier").getAsString();
			String rank = object.get("rank").getAsString();
			String queueType = object.get("queueType").getAsString();
			String wins = object.get("wins").getAsString();
			String losses = object.get("losses").getAsString();
			String summonerName = object.get("summonerName").getAsString();
			String leaguePoints = object.get("leaguePoints").getAsString();
 %>
 <div class = "soloinfo">
  	 <%if(queueType.equals("RANKED_SOLO_5x5")){%>
 	 	<h2>솔로랭크</h2>
 	<%
	if(tier.equals("IRON")){
		%>
		<img  src = "./Tier/Season_2019_Iron_1.png">
		<%
	 }
	 %>
 	<%
 		if(tier.equals("BRONZE")){
 			%>
 			<img  src = "./Tier/Season_2019_Bronze_1.png">
 			<%
 		 }
 	 %>
 	<%
 		if(tier.equals("SILVER")){
 			%>
 			<img  src = "./Tier/Season_2019_Silver_1.png">
 			<%
 		 }
 	 %>
 	<%
 		if(tier.equals("GOLD")){
 			%>
 			<img  src = "./Tier/Season_2019_Gold_1.png">
 			<%
 		 }
 	 %>
 	<%
 		if(tier.equals("PLATINUM")){
 			%>
 			<img  src = "./Tier/Season_2019_Platinum_1.png">
 			<%
 		 }
 	 %>
 	 <%
 		if(tier.equals("DIAMOND")){
 			%>
 			<img  src = "./Tier/Season_2019_Diamond_1.png">
 			<%
 		 }
 	 %>
 	 <%
 		if(tier.equals("MASTER")){
 			%>
 			<img  src = "./Tier/Season_2019_Master_1.png">
 			<%
 		 }
 	 %>
 	 <%
 		if(tier.equals("GRANDMASTER")){
 			%>
 			<img  src = "./Tier/Season_2019_Grandmaster_1.png">
 			<%
 		 }
 	 %>
 	 <%
 		if(tier.equals("CHALLENGER")){
 			%>
 			<img  src = "./Tier/Season_2019_Challenger_1.png">
 			<%
 		 }
 	 %>
 	 <h3><%=leaguePoints%>LP/ 승리: <%=wins%> 패배 :<%=losses%></h3>
 	 <%
 	 }
 	 %>
</div>
 <div class = "freeinfo">
  	 <%if(queueType.equals("RANKED_FLEX_SR")){%>
 	 	<h2>자유랭크</h2>
 	 	<h3>테스트 커밋</h3>
 	<%
	if(tier.equals("IRON")){
		%>
		<img  src = "./Tier/Season_2019_Iron_1.png">
		<%
	 }
	 %>
 	<%
 		if(tier.equals("BRONZE")){
 			%>
 			<img  src = "./Tier/Season_2019_Bronze_1.png">
 			<%
 		 }
 	 %>
 	<%
 		if(tier.equals("SILVER")){
 			%>
 			<img  src = "./Tier/Season_2019_Silver_1.png">
 			<%
 		 }
 	 %>
 	<%
 		if(tier.equals("GOLD")){
 			%>
 			<img  src = "./Tier/Season_2019_Gold_1.png">
 			<%
 		 }
 	 %>
 	<%
 		if(tier.equals("PLATINUM")){
 			%>
 			<img  src = "./Tier/Season_2019_Platinum_1.png">
 			<%
 		 }
 	 %>
 	 <%
 		if(tier.equals("DIAMOND")){
 			%>
 			<img  src = "./Tier/Season_2019_Diamond_1.png">
 			<%
 		 }
 	 %>
 	 <%
 		if(tier.equals("MASTER")){
 			%>
 			<img  src = "./Tier/Season_2019_Master_1.png">
 			<%
 		 }
 	 %>
 	 <%
 		if(tier.equals("GRANDMASTER")){
 			%>
 			<img  src = "./Tier/Season_2019_Grandmaster_1.png">
 			<%
 		 }
 	 %>
 	 <%
 		if(tier.equals("CHALLENGER")){
 			%>
 			<img  src = "./Tier/Season_2019_Challenger_1.png">
 			<%
 		 }
 	 %>
 	 <h3><%=leaguePoints%>LP/ 승리: <%=wins%> 패배 :<%=losses%></h3>
 	 <%
 	 }
		}
 	 %>
</div>
<%
	String url2 = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/"+accountId+"?api_key="+api;

	Document doc3 = Jsoup.connect(url2).ignoreContentType(true).get();
	
	String match = doc3.text();
	
	JsonParser Parser = new JsonParser();
	
	JsonObject jsonObj = (JsonObject) Parser.parse(match);
	
	JsonArray matchArray = (JsonArray) jsonObj.get("matches");
	
	
	for(int i = 0; i < 10; i++) {
		
		JsonObject object = (JsonObject) matchArray.get(i);
		
		String champion = object.get("champion").toString();
		
		String gameId = object.get("gameId").toString();
		
		String url3 = "https://kr.api.riotgames.com/lol/match/v4/matches/"+gameId+"?api_key="+api;
		
		Document doc4 = Jsoup.connect(url3).ignoreContentType(true).get();
		
		String onematchinfo = doc4.text();
		
		JsonObject onematchObject = (JsonObject) Parser.parse(onematchinfo);
		
		JsonArray onematchArray = (JsonArray) onematchObject.get("participantIdentities");
		
		for(int j = 0; j < onematchArray.size(); j++) {
			
		JsonObject player = (JsonObject) onematchArray.get(j);
		
		String playerinfo = player.get("player").toString();
		
		JsonObject playerObject = new JsonObject();
		
		String playerName = player.get("participantId").toString();
		
		System.out.print(playerName);
		}
		
		
		%>
		<div class = "ingamebox">
		<img  src = "./champion/<%=champion%>.png">
		<h3>승리</h3>
		<br>
		</div>
		<%
	}
%>
	  
 <%
	 }
	catch(Exception e) 
	{
		response.sendRedirect("main.jsp");
		System.out.println(e);
	}
%>
</body>
</html>