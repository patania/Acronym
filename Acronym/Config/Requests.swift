//
//  Requests.swift
//  AppMpay
//
//  Created by Albert Patania on 08/08/21.
//
import UIKit
import Foundation
import Alamofire

class Requests: NSObject {
    
    struct response : Codable {
        var code: String
        var data: Int
        var description: String?
    }
    
    /// Almacena el view principal de la pantalla para mostrar el loading
    var mainView : UIView = UIView()
    /// Almacena el modulo de la peticion.
    var module : String = String()
    /// Almacena los parametros de la peticion.
    var parameters : [String : Any] = [:]
    /// Almacena la funcion callBack para el envio de las respuestas exitosas de los peticiones.
    var success : ((_ response: Any?) -> Void)? = nil
    /// Almacena la funcion callBack para el envio de las respuestas fallidas de los peticiones.
    var failure : ((_ error: AFError?) -> Void)? = nil
    /// Almacena el verbo de la peticion.
    var verb : String = String()
    /// Almacena las cabeceras extras.
    var extraHeaders : [String:Any] = [:]
    /// Almacena el string del json que se tomara en la simulacion de respuesta.
    var jsonForSimulate : String = String()
    /// Almacena les tipos de peticiones.
    enum TypeRequests: String {
        case get  = "GET"
        case post = "POST"
        case put  = "PUT"
    }
    
    /**
        Realiza la consulta al modulo almacenado en la variable `module`,
        la respuesta de la peticion es recibida por las funciones de callbacks
        almacenadas en las variables `success` y `failure` del modulo.
        - Returns: void
    */
    func execute() -> Void {
        self.mainView.showLoading()
        var headers = Api.headers
        
   
        if self.extraHeaders.count > 0 {
            for header in self.extraHeaders {
                headers.add(name: header.key, value: header.value as? String ?? String())
            }
        }
        
        if self.jsonForSimulate.isEmpty {
            if let type = TypeRequests(rawValue: self.verb) {
                switch type {
                    case .get:
                        let params = (self.parameters.count > 0) ? self.parameters : nil
                        AF.request(Api.url + self.module, method: .get, parameters: params, headers: headers).responseJSON { response in
                            do {
                                self.mainView.removeLoading()
                                switch response.result {
                                    case .success:
                                        self.success!(try response.result.get())
                                    case let .failure(error):
                                        self.failure!(error)
                                    }
                                
                            } catch {
                                self.failure!(error as? AFError)
                            }
                        }
                    case .post:
                        let params = (self.parameters.count > 0) ? self.parameters : nil
                        AF.request(Api.url + self.module, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                            do {
                                self.mainView.removeLoading()
                                switch response.result {
                                    case .success:
                                        self.success!(try response.result.get())
                                    case let .failure(error):
                                        self.failure!(error)
                                    }
                                
                            } catch {
                                self.failure!(error as? AFError)
                            }
                        }
                    case .put:
                        let params = (self.parameters.count > 0) ? self.parameters : nil
                        AF.request(Api.url + self.module, method: .put, parameters: params, headers: headers).responseJSON { response in
                            do {
                                self.mainView.removeLoading()
                                switch response.result {
                                    case .success:
                                        self.success!(try response.result.get())
                                    case let .failure(error):
                                        self.failure!(error)
                                }
                                
                            } catch {
                                self.failure!(error as? AFError)
                            }
                        }
                }
            }
        } else {
            let json : Data = self.jsonForSimulate.data(using: .utf8)!
             
            do {
                guard let dataDecript = try JSONSerialization.jsonObject(with: json, options : .allowFragments) as? [String : Any] else {
                    return
                }
                self.mainView.removeLoading()
                self.success!(dataDecript)

            } catch {
                print("Error info: ")
            }
        }
    }
    
    /**
        Almacena el modulo al cual se realizara la peticion.
        - Parameters:
            - module: Recibe `String` con el nombre del modulo.
        - Returns: void
    */
    func module(module : String) -> Requests {
        self.module = module
        return self
    }
    
    
    /**
        Almacena los parametros los cuales seran enviados en la peticion.
        - Parameters:
            - params: Recibe `Dict` con los parametros de la peticion.
        - Returns: void
    */
    func params(params : [String : Any]) -> Requests {
        self.parameters = params
        return self
    }
    
    /**
        Almacena la funcion callback que recibira la respuesta exitosa de la peticion.
        - Parameters:
            - callBack: Recibe `Func` con la funcion callback.
        - Returns: void
    */
    func success(callBack: @escaping (_ response: Any?) -> Void) -> Requests {
        self.success = callBack
        return self
    }
    
    /**
        Almacena la funcion callback que recibira la respuesta fallida de la peticion.
        - Parameters:
            - callBack: Recibe `Func` con la funcion callback.
        - Returns: void
    */
    func failure(callBack: @escaping (_ response: AFError?) -> Void) -> Requests {
        self.failure = callBack
        return self
    }
    
    /**
        Almacena el verbo de la peticion.
        - Parameters:
            - verb: Recibe `String` con el verbo de la peticion.
        - Returns: void
    */
    func verb(verb: String) -> Requests {
        self.verb = verb
        return self
    }
    
    /**
        Almacena el view principal de la pantalla desde donde se realiza la peticion.
        - Parameters:
            - verb: Recibe `String` con el verbo de la peticion.
        - Returns: void
    */
    func view(view: UIView) -> Requests {
        self.mainView = view
        return self
    }
    
    /**
        Almacena el view principal de la pantalla desde donde se realiza la peticion.
        - Parameters:
            - verb: Recibe `String` con el verbo de la peticion.
        - Returns: void
    */
    func extraHeader(headers: [String: Any]) -> Requests {
        self.extraHeaders = headers
        return self
    }
    
    /**
        Almacena el view principal de la pantalla desde donde se realiza la peticion.
        - Parameters:
            - verb: Recibe `String` con el verbo de la peticion.
        - Returns: void
    */
    func simulate(json: String) -> Requests {
        self.jsonForSimulate = json
        return self
    }
}
