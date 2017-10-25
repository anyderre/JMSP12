package com.edu.pucmm.JMSP12.Entity;

/**
 * Created by Dany on 24/10/2017.
 */
public interface JmsTempClient {
    void send(Temperatura temperatura);
    Temperatura receive();
}
