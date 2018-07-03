package com.ds.sts1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebSocketController {

	@RequestMapping(value="chatting.do", method=RequestMethod.GET)
	public String chatting() {
		
		
		return "chatting";
		
	}
}
