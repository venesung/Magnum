
				<!-- content_block -->
				<% 
                           String communityKey = "B0039"; 
                           String act = request.getParameter("act"); 
                           String boardID = request.getParameter("search_boardId"); 
             	%> 

	             <jsp:include page="/cms/board/board2/Board.jsp"> 
	                           <jsp:param name="communityKey" value="<%=communityKey%>" /> 
	                           <jsp:param name="act" value="<%=act%>" /> 
	                           <jsp:param name="search_boardId" value="<%=boardID%>" /> 
	             </jsp:include>
				