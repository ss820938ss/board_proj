package board_proj.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ActionMap;

import board_proj.action.Action;
import board_proj.action.BoardDeleteFormAction;
import board_proj.action.BoardDeleteProAction;
import board_proj.action.BoardDetailAction;
import board_proj.action.BoardFileDownAction;
import board_proj.action.BoardListAction;
import board_proj.action.BoardModifyFormAction;
import board_proj.action.BoardModifyProAction;
import board_proj.action.BoardReplyFormAction;
import board_proj.action.BoardReplyProAction;
import board_proj.action.BoardWriteFormAction;
import board_proj.action.BoardWriteProAction;
import board_proj.dto.ActionForward;

@WebServlet(urlPatterns = {"*.do"},
		 loadOnStartup = 1, 
			initParams = {
					@WebInitParam(
							name="configFile", 
							value="/WEB-INF/commandAction.properties")
			}
		)
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> actionMap = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() - config " + config.getInitParameter("configFile"));
		String configFile = config.getInitParameter("configFile");
		try(InputStream is = config.getServletContext().getResourceAsStream(configFile)){
			Properties props = new Properties();
			props.load(is);
			
			System.out.println("props "  + props);
			for(Entry<Object, Object> entry : props.entrySet()) {
//				System.out.println(entry.getKey() + " : " + entry.getValue());
				Class<?> cls = Class.forName((String)entry.getValue());
				Action action = (Action) cls.newInstance();
				actionMap.put((String)entry.getKey(), action);
			}
			
//			for(Entry<String, Action> entry : actionMap.entrySet()) {
//				System.out.println(entry.getKey() + " : " + entry.getValue());
//			}
			
		} catch (IOException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getServletPath();
		
		System.out.println(command);
		
		ActionForward forward=null;
		Action action = null;
		
		action = actionMap.get(command);
		forward = action.execute(request, response);
		
/*		try {
			
			if (command.equals("/boardWriteForm.do")) {
				action = new BoardWriteFormAction();
				forward = action.execute(request, response);
			}else if (command.equals("/boardWritePro.do")) {
				action = new BoardWriteProAction();
				forward = action.execute(request, response);
			}else if (command.equals("/boardList.do")) {
				action = new BoardListAction();
				forward = action.execute(request, response);
			}else if (command.equals("/boardDetail.do")) {
				action = new BoardDetailAction();
				forward = action.execute(request, response);
			}else if (command.equals("/boardDeleteForm.do")) {
				action = new BoardDeleteFormAction();
				forward = action.execute(request, response);
			}else if (command.equals("/boardDeletePro.do")) {
				action = new BoardDeleteProAction();
				forward = action.execute(request, response);
			}else if (command.equals("/file_down.do")) {
				action = new BoardFileDownAction();
				forward = action.execute(request, response);
			}else if (command.equals("/boardModifyForm.do")) {
				action = new BoardModifyFormAction();
				forward = action.execute(request, response);
			}else if (command.equals("/boardModifyPro.do")) {
				action = new BoardModifyProAction();
				forward = action.execute(request, response);
			}else if (command.equals("/boardReplyForm.do")) {
				action = new BoardReplyFormAction();
				forward = action.execute(request, response);
			}else if (command.equals("/boardReplyPro.do")) {
				action = new BoardReplyProAction();
				forward = action.execute(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
*/		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				request.getRequestDispatcher(forward.getPath()).forward(request, response);
			}
		}
		
	}

}
