//
//  Double.swift
//  RPCrypto
//
//  Created by Resat Pekgozlu on 17/03/2023.
//

import Foundation

extension Double {
    /// Converts a Double into a Currency with 2 decimal places
    /// ```
    /// Convert  1234.56 to $1,234.56
    /// ```
    private func currencyFormatter2(currency: String) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // <- defaul value
        formatter.currencyCode = currency.lowercased() // <- change currency
//        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2 decimal places
    /// ```
    /// Convert  1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals(currency: String = "usd") -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2(currency: currency).string(from: number) ?? "0.00"
    }
    
    /// Converts a Double into a Currency with 2-6 decimal places
    /// ```
    /// Convert  1234.56 to $1,234.56
    /// Convert  12.3456 to $12.3456
    /// Convert  0.123456 to $0.123456
    /// ```
    private func currencyFormatter6(currency: String) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // <- defaul value
        formatter.currencyCode = currency // <- change currency
//        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Convert  1234.56 to "$1,234.56"
    /// Convert  12.3456 to "$12.3456"
    /// Convert  0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Decimals(currency: String = "usd") -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6(currency: currency).string(from: number) ?? "0.00"
    }
    
    /// Converts a Double into String representation
    /// ```
    /// Convert  1.23456 to "$1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a Double into String representation with percent symbol
    /// ```
    /// Convert  1.23456 to "$1.23%"
    /// ```
    func asPresentString() -> String {
        return asNumberString() + "%"
        
    }
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45B
    /// Convert 12345678901234 to 12.34T
    /// ``    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)T"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)B"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
}
