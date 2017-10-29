package com.edu.pucmm.JMSP12.Controllers;

import com.edu.pucmm.JMSP12.Entity.Temperatura;
import com.edu.pucmm.JMSP12.Services.TemperaturaServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by Dany on 24/10/2017.
 */
@RestController
@RequestMapping("/api")
public class WebController {

    @Autowired
    private TemperaturaServices temperaturaServices;
    
    @RequestMapping(value = "/buscar/temperatura/{id}", produces = "application/json", method = RequestMethod.GET)
    public ArrayList<Temperatura> buscarTemperaturas(@RequestParam("id")int id){
        return temperaturaServices.buscarTemperaturaPorId(id);
    }

}
