//
//  ValidateViewController.swift
//  BTC Validator
//
//  Created by Abhishek kapoor on 16/10/22.
//

import UIKit

class ValidateViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var btcLabel: UILabel!
	@IBOutlet weak var validateImage: UIImageView!
	
	var qrCodeData:QRData?
	
	static func newInstane(qrCodeData:QRData) -> ValidateViewController {
		let storyboard = UIStoryboard(name: "ValidateViewController", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "ValidateViewController") as! ValidateViewController
		vc.qrCodeData = qrCodeData
		return vc
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.setupUI()
    }
    
	func setupUI() {
		if let qrCodeData = qrCodeData {
			let btcCode = qrCodeData.codeString ?? ""
			if(btcCode.isValidBitcoinAddress()) {
				self.titleLabel.text = Constant.validateMessage
				self.validateImage.image = Constant.validateImage
				self.view.backgroundColor = .green
 			} else {
				self.titleLabel.text = Constant.invalidateMessage
				self.validateImage.image = Constant.invalidateImage
				self.view.backgroundColor = .red
 			}
			self.btcLabel.text = btcCode
		}
	}

	@IBAction func scanAnotherQrTapped(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
}
