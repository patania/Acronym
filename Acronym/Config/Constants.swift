//
//  Constants.swift
//  AppMpay
//
//  Created by Albert Patania on 07/31/21.
//

import Foundation
import Foundation
import Alamofire

public let Storage = UserDefaults.standard
let KAppDelegate: AppDelegate           =      UIApplication.shared.delegate as! AppDelegate
public let AppUserDefaults            =      UserDefaults.standard
public let AppNotificationCenter      =      NotificationCenter.default
public typealias Dict             =      [String : Any]



public struct Base {
    public static let environment = Environment.debug
  //  public static let inactivityTimeSeconds : Double = 5 * 60
    public static let inactivityTimeSeconds : Double = 5 * 60
}
public struct Environment {
    public static let debug = "DEBUG"
    public static let production = "PRODUCTION"
}



public struct Api {

    //public static let seedUrl = "https://walletservicesca-dev.mpaycenter.com"
    public static let url = "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf="
    
    static var headers: HTTPHeaders = [:]

 
}

