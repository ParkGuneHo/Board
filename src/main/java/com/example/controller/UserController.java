package com.example.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.UserVO;
import com.example.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
    @Inject 
    UserService service;
    
    @Inject 
    BCryptPasswordEncoder pwdEncoder;
    
    // 회원가입 
 	@RequestMapping(value = "/register", method = RequestMethod.GET)
 	public void getRegister() throws Exception {
 		logger.info("get register");
 	}
 	
 	
 	@RequestMapping(value = "/register", method = RequestMethod.POST)
 	public String postRegister(UserVO dto) throws Exception {
 		logger.info("post register");
 		
 		int result = service.idChk(dto);
 		
 		try {
 			if(result == 1) {
 				return "/register";
 			}else if(result == 0) {
 				String inputPass = dto.getUserPw();
 				String pwd = pwdEncoder.encode(inputPass);
 				dto.setUserPw(pwd);
 				
 				service.register(dto);
 			}
 		} catch (Exception e) {
 			throw new RuntimeException();
 		}
 		return "redirect:/";
 	}
 	
 	// 아이디 중복 체크
 	@ResponseBody
 	@RequestMapping(value="/idChk", method = RequestMethod.POST)
 	public int idChk(UserVO dto) throws Exception {
 		int result = service.idChk(dto);
 		return result;
 	}
    
    // 로그인
    @RequestMapping(value="/login",method=RequestMethod.GET)
    public String loginForm(){
        return "Login"; 
    }
    
    @RequestMapping(value="/loginProcess",method=RequestMethod.POST)
    public String loginProcess(HttpSession session,UserVO dto,HttpServletResponse response){
        String returnURL ="";
        if ( session.getAttribute("login") !=null ){
            session.removeAttribute("login"); 
        }
         
       
        UserVO vo = service.login(dto);
        boolean pwdMatch = pwdEncoder.matches(dto.getUserPw(), vo.getUserPw());
        
        if ( vo !=null && pwdMatch == true){
            session.setAttribute("login", vo); 
            returnURL ="redirect:/"; 
            logger.info("login success");
            logger.info( vo.getUserName() );
            
            if ( dto.isUseCookie() ){
                Cookie cookie =new Cookie("loginCookie", session.getId());
                cookie.setPath("/");
                cookie.setMaxAge(60*60*24*7);
                response.addCookie(cookie);
            }
            
        }else {
            returnURL ="redirect:/login";
            logger.info("login failed");
        }
         
        return returnURL;
    }
 
    
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        logger.info("logout success");
        return "redirect:/";
    }
}
