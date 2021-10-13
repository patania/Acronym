//
//  BaseController.swift
//  Acronym
//
//  Created by Albert Patania on 10/04/21.
//

import UIKit

class BaseController: UIViewController {
    class var storyboardName: String {
        return ""
    }
    
    func _storyboard(name: String) ->  UIStoryboard? {
        return UIStoryboard(name: name, bundle:nil)
    }
    class func storyboard() -> String {
        return storyboardName
    }
    class func identifier() -> String {
        return String(describing: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        _initializer()
    }
    
    func _initializer() {
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func showController<T>(storyboard : String, identifier : String, type : T.Type, params : Dict = [:]) {
          let storyboard = UIStoryboard(name: storyboard, bundle:nil)
          if let instanceController = storyboard .instantiateViewController(withIdentifier: identifier) as? T {
            for param in params {
                (instanceController as! NSObject).setValue(param.value, forKey: param.key)
            }
             self.navigationController?.pushViewController(instanceController as! UIViewController, animated: true)
              
          }
      }
    
    func initApp<T>(storyboard : String, identifier : String, type : T.Type, params : Dict = [:]) {
        let storyboard = UIStoryboard(name: storyboard, bundle:nil)
        if let viewController = storyboard .instantiateViewController(withIdentifier: identifier) as? T {
          //loginController.logout  = logout
            for param in params {
                (viewController as! NSObject).setValue(param.value, forKey: param.key)
            }
            let navigationController = UINavigationController(rootViewController: viewController as! UIViewController)
          
            KAppDelegate.window?.rootViewController = navigationController
            
        }
      }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
