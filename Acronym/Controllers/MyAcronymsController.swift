//
//  MyAcronymsController.swift
//  Acronym
//
//  Created by Albert Patania on 10/04/21.
//

import UIKit

class MyAcronymsController: BaseController {
    @IBOutlet weak var acronymTable: UITableView!
    @objc var items : [[String: Any]] = []
    override class var storyboardName : String {
        return "Acronym"
    }
    
    // MARK:  View Controller Identifier
   override class func identifier() -> String {
       return "MyAcronymsController"
   }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func _initializer() {
       super._initializer()
        self.acronymTable.delegate = self
        self.acronymTable.dataSource = self
        self.acronymTable.reloadData()
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
extension MyAcronymsController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return items.count
           }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "AcronymCell")  as!  AcronymCell
            cell.name.text = item["lf"] as? String ?? ""
        cell.freq.text = "Freq: \(item["freq"] as? Int ?? 0)"
        cell.since.text = "Since: \(item["since"] as? Int ?? 0)"
       
    
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  90.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        let params : [String : Any] = [
            "items" : item["vars"] as? [[String : Any]] ?? []
        ]
        self.showController(storyboard: VarsController.storyboard(), identifier: VarsController.identifier(), type: VarsController.self, params: params)
    }
}
