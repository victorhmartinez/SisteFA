/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FSA.DAT;

import FSA.ENT.FarmaciaJ;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Usuario
 */
@RestController


public class FarmaciaControler {
    @GetMapping("/farmacia")
    public FarmaciaJ listar(){
        return new FarmaciaJ(1,"Primeros Auxilios");
    }
}
