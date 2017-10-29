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
   private JmsTemplate jmsTemplate;

    @Autowired
    private TemperaturaServices temperaturaServices;

    @JmsListener(destination = "temp")
    public void recieve()throws JMSException{
       Temperatura temperatura = (Temperatura) jmsTemplate.receiveAndConvert("temp");
        System.out.println("Recibe la trasaccion");
        System.out.println(temperatura.getIdDispositivo());
        temperaturaServices.guardarTemperatura(temperatura);
    }
}
