package controller;
import sendinblue.ApiClient;
import sendinblue.Configuration;
import sendinblue.auth.ApiKeyAuth;
import sibApi.TransactionalEmailsApi;
import sibModel.*;

import java.io.IOException;
import java.util.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MailController extends HttpServlet {
	@Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String action=request.getParameter("action");
        String url = "/contact.jsp";
        
        if (action == null) {
        	url="/contact.jsp";
        }
        // perform action and set URL to appropriate page
        
        if (action !=null && action.equals("sendEmail")) {
        	ApiClient defaultClient = Configuration.getDefaultApiClient();
            // Configure API key authorization: api-key
            ApiKeyAuth apiKey = (ApiKeyAuth) defaultClient.getAuthentication("api-key");
            apiKey.setApiKey("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"); //De api trong file txt vao day
            request.setCharacterEncoding("UTF-8");
            String userName=request.getParameter("name");
            String userEmail= request.getParameter("email");
            String userSubject=request.getParameter("subject");
            String userMessage=request.getParameter("message");
          try {
                        TransactionalEmailsApi api = new TransactionalEmailsApi();
                        SendSmtpEmailSender sender = new SendSmtpEmailSender();
                        sender.setEmail("testnixomg123@gmail.com");
                        sender.setName(userName);
                        List<SendSmtpEmailTo> toList = new ArrayList<SendSmtpEmailTo>();
                        SendSmtpEmailTo to = new SendSmtpEmailTo();
                        to.setEmail("21110852@student.hcmute.edu.vn");
                        to.setName("Duy Tan");
                        toList.add(to);
                        
                        
                        
                        Properties headers = new Properties();
                        headers.setProperty("Some-Custom-Name", "unique-id-1234");
                        Properties params = new Properties();
                        params.setProperty("parameter", "My param value");
                        params.setProperty("userSubject", userSubject);
                        params.setProperty("userMessage", userMessage);
                        params.setProperty("userName", userName);
                        params.setProperty("userEmail", userEmail);
                        SendSmtpEmail sendSmtpEmail = new SendSmtpEmail();
                        sendSmtpEmail.setSender(sender);
                        sendSmtpEmail.setTo(toList);
                        sendSmtpEmail.setTextContent(userSubject);
                        sendSmtpEmail.setTextContent(userMessage);
                        sendSmtpEmail.setTextContent(userName);
                        sendSmtpEmail.setTextContent(userEmail);                        
                        sendSmtpEmail.setSubject("Guest Suggestion");
                        sendSmtpEmail.setHeaders(headers);
                        sendSmtpEmail.setParams(params);
                        sendSmtpEmail.setTemplateId(2L);
                        CreateSmtpEmail res = api.sendTransacEmail(sendSmtpEmail);
                        System.out.println(res.toString());
                        url="/contact.jsp";
                    } 
          catch (Exception e) {
                        System.out.println("Exception occurred:- " + e.getMessage());
          }          
        }

        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
	@Override
	public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {
		String action=request.getParameter("action");
        String url = "/contact.jsp";
        
        if (action == null) {
        	url="/contact.jsp";
        }
        getServletContext()
        .getRequestDispatcher(url)
        .forward(request, response);
	}
}
