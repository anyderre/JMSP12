package com.edu.pucmm.JMSP12.Services;


import com.edu.pucmm.JMSP12.Entity.Temperatura;
import com.edu.pucmm.JMSP12.Repository.TemperaraturaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Dany on 23/10/2017.
 */
@Service
public class TemperaturaServices {
    @Autowired
    TemperaraturaRepository temperaraturaRepository;

    public Temperatura guardarTemperatura(Temperatura temperatura){
        return temperaraturaRepository.save(temperatura);
    }

    public ArrayList<Temperatura> todasTemperaturas(){
        return temperaraturaRepository.findAll();
    }

    public ArrayList<Temperatura> buscarTemperaturaPorId(int id){
        return temperaraturaRepository.findFirst10ByIdDispositivoOrderById(id);
    }
}
