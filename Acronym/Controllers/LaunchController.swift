//
//  ViewController.swift
//  Acronym
//
//  Created by Albert Patania on 10/04/21.
//

import UIKit

class LaunchController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initApp(storyboard: SeekerController.storyboard(), identifier: SeekerController.identifier(), type: SeekerController.self, params: [:])
        // Do any additional setup after loading the view.
    }


}

