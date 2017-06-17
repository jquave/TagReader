//
//  ViewController.swift
//  TagReader
//
//  Created by Jameson Quave on 6/16/17.
//  Copyright © 2017 Jameson Quave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let helper = NFCHelper()
  var payloadLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let button = UIButton(type: .system)
    button.setTitle("Read NFC", for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 28.0)
    button.addTarget(self, action: #selector(didTapReadNFC), for: .touchUpInside)
    button.frame = CGRect(x: 60, y: 200, width: self.view.bounds.width - 120, height: 80)
    self.view.addSubview(button)
    
    payloadLabel = UILabel(frame: button.frame.offsetBy(dx: 0, dy: 300))
    payloadLabel.numberOfLines = 10
    payloadLabel.text = "Scan an NFC Tag"
    self.view.addSubview(payloadLabel)
  }
  
  func onNFCResult(success: Bool, msg: String) {
    DispatchQueue.main.async {
      self.payloadLabel.text = "\(self.payloadLabel.text!)\n\(msg)"
    }
  }
  
  @objc func didTapReadNFC() {
    print("didTapReadNFC")
    self.payloadLabel.text = ""
    helper.onNFCResult = onNFCResult(success:msg:)
    helper.restartSession()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

