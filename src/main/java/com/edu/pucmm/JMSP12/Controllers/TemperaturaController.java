package com.edu.pucmm.JMSP12.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Dany on 25/10/2017.
 */
@Controller
@RequestMapping("/")
public class TemperaturaController {

    @RequestMapping("/")
    public String indice(){
        return "charts";
    }
    @RequestMapping("/producir/Temperatura/")
    public String producir(){
        return "EnviarTemp";
    }
}