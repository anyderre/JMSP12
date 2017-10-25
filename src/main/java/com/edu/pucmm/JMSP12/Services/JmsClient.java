package com.edu.pucmm.JMSP12.Services;

import com.edu.pucmm.JMSP12.Entity.Consumidor;
import com.edu.pucmm.JMSP12.Entity.JmsTempClient;
import com.edu.pucmm.JMSP12.Entity.Producer;
import com.edu.pucmm.JMSP12.Entity.Temperatura;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Dany on 24/10/2017.
 */
@Service
public class JmsClient implements JmsTempClient {
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
