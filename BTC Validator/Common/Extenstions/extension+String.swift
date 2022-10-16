//
//  extension+String.swift
//  BTC Validator
//
//  Created by Abhishek kapoor on 16/10/22.
//

import Foundation
extension String {
	func isValidBitcoinAddress() -> Bool {
		let pattern = "([13]|bc1p|bc1q)[A-HJ-NP-Za-km-z1-9]{27,34}"
		let range = NSPredicate(format:"SELF MATCHES %@", pattern)
		return range.evaluate(with: self.trimmingCharacters(in:.whitespaces))
	}
}
