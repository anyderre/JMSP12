package com.edu.pucmm.JMSP12.Entity;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Dany on 24/10/2017.
 */
public class JmsClient implements  JmsTempClient{
    @Autowired
    Consumidor consumidor;
    @Autowired
    Producer producer;

    @Override
    public void send(Temperatura temperatura) {
        producer.send(temperatura);
    }

    @Override
    public Temperatura receive() {
        return consumidor.recieve();
    }
}
