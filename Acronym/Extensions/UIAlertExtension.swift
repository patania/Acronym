//
//  UIAlertExtension.swift
//  AppMpay
//
//  Created by Albert Patania on 08/09/21.
//
import UIKit

typealias ActionHandler  = (_ title: String) -> Void
typealias FieldActionHandler = (_ title: String,_ fieldText: String) -> Void

extension UIAlertController {
    

    
    //MARK:  Show Message with Multiple Options
    class func showWithAction(_ sender: UIViewController, _ title: String?, _ message: String?, _ cancelTitle: String? = nil, _ destructiveOptions: [String]? = nil, _ otherOptions: [String]? = nil, _ isAlert: Bool = true, _ completion: @escaping ActionHandler) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: isAlert ? .alert : .actionSheet)
        
        if let cancel =  cancelTitle {
            alertController.addAction(UIAlertAction(title: cancel, style: .cancel, handler: {
                (action : UIAlertAction) -> Void in
                completion(action.title!)
            }))
        }
        if let distructive = destructiveOptions, distructive.count > 0 {
            for title in distructive {
                alertController.addAction(UIAlertAction(title: title, style: .destructive, handler: {
                    (action : UIAlertAction) -> Void in
                    completion(action.title!)
                }))
            }
        }
        if let others = otherOptions, others.count > 0 {
            for title in others {
                alertController.addAction(UIAlertAction(title: title, style: .default, handler: {
                    (action : UIAlertAction) -> Void in
                    completion(action.title!)
                }))
            }
        }
        
        DispatchQueue.main.async {
            if !isAlert && UIDevice.current.userInterfaceIdiom == .pad {
                alertController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
                alertController.popoverPresentationController?.sourceRect = self.sourceRectForBottomAlertController(alertController)();
                alertController.popoverPresentationController!.sourceView = sender.view;
                sender.present(alertController, animated: true, completion: nil)
            }
            else {
                sender.present(alertController, animated: true, completion: nil)
            }
        }
    }

    
    //MARK:  Private Methods
    private func sourceRectForBottomAlertController() -> CGRect {
        var sourceRect :CGRect = CGRect.zero
        sourceRect.origin.x = self.view.bounds.midX - self.view.frame.origin.x/2.0
        sourceRect.origin.y = self.view.bounds.midY
        return sourceRect
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}
