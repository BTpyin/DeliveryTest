//
//  ViewController.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 5/1/2022.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class BaseViewController : UIViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = UIColor.white

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func showAlert(_ title: String?, okClicked: ((UIAlertAction) -> Void)? = nil) {
      let alertVC = UIAlertController.init(title: title, message: nil, preferredStyle: .alert)
      alertVC.addAction(UIAlertAction.init(title: "OK", style: .default, handler: okClicked))
      present(alertVC, animated: true, completion: nil)
    }
    
    

}

