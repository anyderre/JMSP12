package com.edu.pucmm.JMSP12.Repository;


import com.edu.pucmm.JMSP12.Entity.Temperatura;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dany on 23/10/2017.
 */
public interface TemperaraturaRepository extends JpaRepository<Temperatura, Integer> {

    Temperatura save(Temperatura temperatura);
    List<Temperatura> findAll();
    List<Temperatura> findAllById(int id);

}
