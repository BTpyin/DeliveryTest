//
//  RootNavigationController.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 5/1/2022.
//

import UIKit

class RootNavigationController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deliveryMainViewController = DeliveryMainViewController()
        deliveryMainViewController.navigationController?.navigationBar.backItem?.hidesBackButton = true
        self.pushViewController(deliveryMainViewController, animated: true)
        
    }
    

}
