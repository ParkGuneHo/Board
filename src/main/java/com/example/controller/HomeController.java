package com.example.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.BoardVO;
import com.example.dto.ReplyVO;
import com.example.service.BoardService;
import com.example.service.ReplyService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService service;
	
	@Inject
    ReplyService replyService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{
		
		logger.info("home");
		
		List<BoardVO> boardList = service.selectBoard();
		
		model.addAttribute("boardList", boardList);

		return "home";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
    public String getcreate() throws Exception {
       return "create";
    }
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
    public String postcreate(BoardVO vo) throws Exception {
    	service.create(vo);
       return "redirect:/";
    }

	public int tmp;
	@RequestMapping(value= "/view", method = RequestMethod.GET)
	public String getView(@RequestParam("no") int no, Model model) throws Exception {
		BoardVO vo = service.view(no);
		model.addAttribute("view", vo);
		
		List<ReplyVO> list = replyService.list(no);
        model.addAttribute("list", list);
        
        tmp=no;
		return "view";
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getModify(@RequestParam("no") int no, Model model) throws Exception {
		BoardVO vo = service.view(no);
		model.addAttribute("view", vo);
	}
	
	@RequestMapping(value ="/update", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception{
		service.update(vo);
			
		return "redirect:/";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String postdelete(@RequestParam("no") int no) throws Exception {
		
		service.delete(no);
		return "redirect:/";
    }
	
	
	
	// 댓글관련
	@RequestMapping("insert")
    public String insert(@ModelAttribute ReplyVO vo, HttpSession session){
    	logger.info("reply insert");
        replyService.create(vo);
        
        return "redirect:/view?no="+vo.getBno();
    }
	
	// 댓글 수정 	
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo) throws Exception {
	 logger.info("reply update");
	 replyService.update(vo);
	 
	 return "redirect:/view?no="+tmp;
	}

	// 댓글 삭제
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public String replyDelete(@RequestParam("no") int no) throws Exception {
		logger.info("reply delete");
		replyService.delete(no);
		 
		return "redirect:/view?no="+tmp;
	}
	
	
	
}
