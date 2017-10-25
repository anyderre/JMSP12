package com.edu.pucmm.JMSP12.Controllers;

import com.edu.pucmm.JMSP12.Entity.JmsClient;
import com.edu.pucmm.JMSP12.Entity.Temperatura;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Dany on 24/10/2017.
 */
@RestController
public class WebController {
    @Autowired
    JmsClient jmsClient;

    @RequestMapping(value="/produce", consumes = "application/json")
    public String produce(@RequestParam("msg")Temperatura msg){
        jmsClient.send(msg);
        return "Done";
    }

//    @RequestMapping(value="/receive")
//    public String receive(){
//        return jsmClient.receive();
//    }

}
