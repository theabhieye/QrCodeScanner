//
//  Util.swift
//  BTC Validator
//
//  Created by Abhishek kapoor on 16/10/22.
//

import UIKit

class Util {
	static func presentAlert(viewController:UIViewController,withTitle title: String, message : String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let OKAction = UIAlertAction(title: "OK", style: .default) { action in
			print("You've pressed OK Button")
		}
		alertController.addAction(OKAction)
		viewController.present(alertController, animated: true, completion: nil)
	}
 }
