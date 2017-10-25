package com.edu.pucmm.JMSP12.Entity;

import groovy.util.logging.Commons;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

/**
 * Created by Dany on 24/10/2017.
 */
@Component
public class Producer {
    @Autowired
    private JmsTemplate jmsTemplate;

    @Value("${jms.queue.destination}")
    String cola;

    public void send(Temperatura temperatura){
        jmsTemplate.convertAndSend(cola, temperatura);
    }
}
