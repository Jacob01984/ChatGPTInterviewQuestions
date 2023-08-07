//
//  Formatters.swift
//  ChatGPTInterview
//
//  Created by Jacob Lavenant on 8/7/23.
//

import Foundation

extension Double {
    func formatted(withDecimalPlaces decimalPlaces: Int) -> String {
        return String(format: "%.\(decimalPlaces)f", self)
    }
}
