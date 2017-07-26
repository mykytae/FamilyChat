package com.familychat.controller;

import com.familychat.entity.Message;
import com.familychat.entity.OutputMessage;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
@RequestMapping("/")
public class MainController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView viewApplication() {
        ModelAndView model = new ModelAndView();
        model.setViewName("chat");
        return model;
    }

    @MessageMapping("/chat")
    @SendTo("/room/message")
    public OutputMessage sendMessage(Message message) {
        return new OutputMessage(message, new Date());
    }

}
