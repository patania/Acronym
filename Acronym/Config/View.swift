//
//  View.swift
//  Acronym
//
//  Created by Albert Patania on 10/04/21.
//
import UIKit

class View {
    
    /**
        Carga en un objeto `UIStoryboard` la vista con el nombre recibido.
        - Parameters:
            - storyboard: Recibe un string con el nombre del storyboard que se quiere instanciar.
        - Returns: UIStoryboard contenedor de la vista
    */
    class func _instance(storyboard : String) -> UIStoryboard {
        return UIStoryboard(name: storyboard, bundle: nil)
    }
}
