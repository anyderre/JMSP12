package com.edu.pucmm.JMSP12.Entity;

import com.edu.pucmm.JMSP12.Entity.Temperatura;
import com.edu.pucmm.JMSP12.Services.TemperaturaServices;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.broker.Connection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

import javax.jms.*;

/**
 * Created by Dany on 23/10/2017.
 */
@Component
public class Consumidor {
    @Autowired
    JmsTemplate jmsTemplate;

    @Autowired
    private TemperaturaServices temperaturaServices;
    @Value("${jms.queue.destination}")
    String cola;
//@JmsListener(destination = "temperaturaMessage", containerFactory = "temperaturaFactory")

    public Temperatura recieve(){
        Temperatura temperatura = (Temperatura) jmsTemplate.receiveAndConvert(cola);
        System.out.println("Recibe la trasaccion"+ temperatura);
        temperaturaServices.guardarTemperatura(temperatura);
        return temperatura;
    }
}
