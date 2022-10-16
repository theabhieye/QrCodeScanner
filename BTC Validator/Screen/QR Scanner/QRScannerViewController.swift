//
//  QRScannerViewController.swift
//  BTC Validator
//
//  Created by Abhishek kapoor on 16/10/22.
//

import UIKit

class QRScannerViewController: UIViewController {
	
	@IBOutlet weak var scannerView: QRScannerView! {
		didSet {
			scannerView.delegate = self
		}
	}
	@IBOutlet weak var scanButton: UIButton! {
		didSet {
			scanButton.setTitle("STOP", for: .normal)
		}
	}
	
	var qrData: QRData? = nil {
		didSet {
			if qrData != nil {
				self.goToValidateScreen()
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if !scannerView.isRunning {
			scannerView.startScanning()
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		if !scannerView.isRunning {
			scannerView.stopScanning()
		}
	}
	
	@IBAction func scanButtonAction(_ sender: UIButton) {
		scannerView.isRunning ? scannerView.stopScanning() : scannerView.startScanning()
		let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
		sender.setTitle(buttonTitle, for: .normal)
	}
	
	private func goToValidateScreen() {
		guard let qrData = self.qrData else { return }
		let validateViewController = ValidateViewController.newInstane(qrCodeData: qrData)
		self.navigationController?.pushViewController(validateViewController, animated: true)
	}
}


extension QRScannerViewController: QRScannerViewDelegate {
	func qrScanningDidStop() {
		let buttonTitle = scannerView.isRunning ? "STOP" : "SCAN"
		scanButton.setTitle(buttonTitle, for: .normal)
	}
	
	func qrScanningDidFail() {
		Util.presentAlert(viewController:self, withTitle: "Error", message: "Scanning Failed. Please try again")
	}
	
	func qrScanningSucceededWithCode(_ str: String?) {
		self.qrData = QRData(codeString: str)
	}
	
}


extension QRScannerViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		if segue.identifier == "detailSeuge", let viewController = segue.destination as? DetailViewController {
//			viewController.qrData = self.qrData
//		}
	}
}

