//
//  BaseInterface.swift
//  AppMpay
//
//  Created by Albert Patania on 08/09/21.
//Interface
import UIKit
import Foundation
import Alamofire

class BaseInterface {
    /// Almacena la funcion callBack para el envio de la respuesta de los metodos.
    var onResponse : ((_ successfully: Bool ,_ response: Any?) -> Void)? = nil
    
    /**
        Metodo GET por defecto de todos los modelos, la respuesta de la peticion
        es recibida por las funciones de callbacks almacenadas en las variables
        `success` y `failure` del modulo.
        - Returns: void
    */
    func get(params : [String : Any] = [:]) -> Void {
        Requests().module(module: self.getNameModule())
            .params(params: params)
            .verb(verb: "GET")
            .success(callBack: {
                (response) -> Void in self.onResponse!(true, response)
            })
            .failure(callBack: {
                (error) -> Void in self.onResponse!(false, error)
            })
            .execute()
    }
    
    /**
        Metodo POST por defecto de todos los modelos, la respuesta de la peticion
        es recibida por las funciones de callbacks almacenadas en las variables
        `success` y `failure` del modulo.
        - Returns: void
    */
    func post(params : [String : Any] = [:]) -> Void {
        Requests().module(module: self.getNameModule())
            .params(params: params)
            .verb(verb: "POST")
            .success(callBack: {
                (response) -> Void in self.onResponse!(true, response)
            })
            .failure(callBack: {
                (error) -> Void in self.onResponse!(false, error)
            })
            .execute()
    }
    
    /**
        Metodo PUT por defecto de todos los modelos, la respuesta de la peticion
        es recibida por las funciones de callbacks almacenadas en las variables
        `success` y `failure` del modulo.
        - Returns: void
    */
    func put(params : [String : Any] = [:]) -> Void {
        Requests().module(module: self.getNameModule())
            .params(params: params)
            .verb(verb: "PUT")
            .success(callBack: {
                (response) -> Void in self.onResponse!(true, response)
            })
            .failure(callBack: {
                (error) -> Void in self.onResponse!(false, error)
            })
            .execute()
    }
    
    /**
        Almacena la funcion callback que recibira la respuesta exitosa de la peticion.
        - Parameters:
            - callBack: Recibe `Func` con la funcion callback.
        - Returns: void
    */
    func onResponse(callBack: @escaping (_ successfully: Bool , _ response: Any?) -> Void) -> Self {
        self.onResponse = callBack
        return self
    }
    
    /**
        Obtiene el nombre de la clase que ha heredado de Model.
        - Returns: Retorna el nombre de la clase.
    */
    private func getNameModule() -> String {
        return String(describing: self).replacingOccurrences(of: "Model", with: "").replacingOccurrences(of:
            Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String, with: "").replacingOccurrences(of: ".", with: "").lowercased()
    }
}
