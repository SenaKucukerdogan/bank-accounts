//
//  DecimalUtils.swift
//  BankApp
//
//  Created by Sena Küçükerdoğan on 29.12.2024.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
