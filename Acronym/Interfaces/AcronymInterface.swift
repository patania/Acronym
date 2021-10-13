//
//  AcronymInterface.swift
//  Acronym
//
//  Created by Albert Patania on 10/05/21.
//
import UIKit

class AcronymInterface: BaseInterface {
    
    /**
       Metodo para realizar peticion de login a la API.
       - Returns: void
    */
    func getAcronym(urlExtra: String, mainView : UIView = UIView()) -> Void {
        Requests().module(module: urlExtra)
           .verb(verb: "GET")
           .view(view: mainView)
           .success(callBack: {
            (response) -> Void in self.onResponse!(true, response)
           })
           .failure(callBack: {
               (response) -> Void in self.onResponse!(false, response)
           })
           .execute()
    }
    

}
