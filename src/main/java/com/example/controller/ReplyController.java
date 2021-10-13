package com.example.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.ReplyVO;
import com.example.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
    
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
    @Inject
    ReplyService replyService;
    
    // 댓글 입력
    @RequestMapping("insert.do")
    public void insert(@ModelAttribute ReplyVO vo, HttpSession session){
    	logger.info("reply insert");
        String userId = (String) session.getAttribute("userId");
        vo.setUserName(userId);
        replyService.create(vo);
    }
    
    // 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
    @RequestMapping("list.do")
    public ModelAndView list(@RequestParam int bno, ModelAndView mav){
    	logger.info("reply list");
        List<ReplyVO> list = replyService.list(bno);
        // 뷰이름 지정
        mav.setViewName("/replyList");
        // 뷰에 전달할 데이터 지정
        mav.addObject("list", list);
        // replyList.jsp로 포워딩
        return mav;
    }
   
}
