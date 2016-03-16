//
//  ViewController.swift
//  AssetCatalogs
//
//  Created by sodas on 3/16/16.
//  Copyright © 2016 NCCU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deviceTypeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let deviceTextData = NSDataAsset(name: "DeviceText")!.data
        let deviceText = NSString(data: deviceTextData, encoding: NSUTF8StringEncoding)!
        self.deviceTypeLabel.text = deviceText as String

        let uiImage = UIImage(named: "Circle")
        print(uiImage)
    }

}
