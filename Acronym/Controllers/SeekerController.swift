//
//  SeekerController.swift
//  Acronym
//
//  Created by Albert Patania on 10/04/21.
//

import UIKit

class SeekerController: BaseController {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet var background: UIView!
    override class var storyboardName : String {
        return "Acronym"
    }
    
    // MARK:  View Controller Identifier
   override class func identifier() -> String {
       return "SeekerController"
   }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func search(_ sender: Any) {
        self.view.endEditing(true)
        if (searchField.text ?? "").trimSpace() != ""{
            goAcronynms(sf: (searchField.text  ?? "").trimSpace())
        }else {
            UIAlertController.showWithAction(self, "", "Enter an acronym", nil, nil, ["OK"], true, { (title) in

                                   })
        }
      
    }
    func goAcronynms(sf: String){
        
        AcronymInterface().onResponse(callBack: { (successfully, response) -> Void in
            if (successfully) {
                let myAcronyms : [[String : Any]] = response as? [[String : Any]] ?? []
                if myAcronyms.count > 0{
                let acronym : [String : Any] = myAcronyms[0] as? [String : Any] ?? [:]
               print("response \(acronym)")
                
                let params : [String : Any] = [
                    "items" : acronym["lfs"] as? [[String : Any]] ?? []
                ]
                self.showController(storyboard: MyAcronymsController.storyboard(), identifier: MyAcronymsController.identifier(), type: MyAcronymsController.self, params: params)
                }else{
                    
                        UIAlertController.showWithAction(self, "", "No Data.", nil, nil, ["OK"], true, { (title) in

                                               })
                }
            } else {
                UIAlertController.showWithAction(self, "", "Inconvenient.", nil, nil, ["OK"], true, { (title) in

                                       })
            }
        })
            .getAcronym(urlExtra:sf, mainView: background)
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
