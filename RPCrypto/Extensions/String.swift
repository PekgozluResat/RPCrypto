//
//  String.swift
//  RPCrypto
//
//  Created by Resat Pekgozlu on 03/04/2023.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
