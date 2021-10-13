//
//  StringExtension.swift
//  AppMpay
//
//  Created by Albert Patania on 07/31/21.
//

import Foundation

extension String {

    init(htmlEncodedString: String) {
        self.init()
        guard let encodedData = htmlEncodedString.data(using: .utf8) else {
            self = htmlEncodedString
            return
        }

        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            self = attributedString.string
        } catch {
            print("Error: \(error)")
            self = htmlEncodedString
        }
      }
    


    public func trimSpace() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func length() -> Int {
        return self.count
    }
    

}


extension NSString {
    var clearCurrency: String {
        return self.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: "")
    }
}
