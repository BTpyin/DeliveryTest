//
//  DeliveryDetailViewController.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 6/1/2022.
//

import UIKit

class DeliveryDetailViewController: BaseViewController {

    var viewModel: DeliveryDetailViewModel?
    
    lazy var locationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var deliverView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var goodImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.and.person.fill")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var feeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let fromText: UILabel = {
       let lbl = UILabel()
        lbl.text = "From: "
        lbl.font = .regular14
        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 1
        lbl.sizeToFit()
        return lbl
    }()
    
    let toText: UILabel = {
       let lbl = UILabel()
        lbl.text = "To: "
        lbl.textColor = UIColor.darkGray
        lbl.font = .regular14
        lbl.numberOfLines = 1
        lbl.sizeToFit()
        return lbl
    }()
    
    let deliveryStartFrom: UILabel = {
       let lbl = UILabel()
        lbl.font = .bold14
        lbl.textAlignment = .left
        lbl.text = "dfsdsfs"
        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    let deliveryDestination: UILabel = {
       let lbl = UILabel()
        lbl.font = .bold14
        lbl.textAlignment = .left
        lbl.text = "dfsdsfs"
        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    let deliverText: UILabel = {
       let lbl = UILabel()
        lbl.text = "Goods to deliver"
        lbl.textColor = UIColor.darkGray
        lbl.font = .regular14
        lbl.numberOfLines = 1
        lbl.sizeToFit()
        return lbl
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setupBinding()
        initConstraints()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        
        self.view.addSubviews(
            locationView,
            deliverView,
            feeView
        )
        
        locationView.addSubviews(
            fromText,
            toText,
            deliveryDestination,
            deliveryStartFrom
        )
        
        deliverView.addSubviews(
            deliverText,
            goodImageView
        )
    }
    
    func setupBinding() {
        viewModel?.output.deliveryFrom.subscribe(onNext: {[weak self]from in
            self?.deliveryStartFrom.text = from
        }).disposed(by: disposeBag)
    }
    
    func initConstraints() {
        locationView.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(10)
            maker.leading.equalToSuperview().offset(10)
            maker.trailing.equalToSuperview().inset(10)
        }
        
        deliverView.snp.makeConstraints{(maker) in
            maker.top.equalTo(locationView.snp.bottom).offset(15)
            maker.leading.equalToSuperview().offset(10)
            maker.trailing.equalToSuperview().inset(10)
        }
        
        fromText.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(10)
            maker.leading.equalToSuperview().offset(5)
        }
        
        deliveryStartFrom.snp.makeConstraints{(maker) in
            maker.top.equalTo(fromText.snp.top)
            maker.leading.equalTo(fromText.snp.trailing).offset(10)
            maker.trailing.equalToSuperview().inset(10)
        }
        
        toText.snp.makeConstraints{(maker) in
            maker.top.equalTo(deliveryStartFrom.snp.bottom).offset(10)
            maker.leading.equalToSuperview().offset(5)
        }
        
        deliveryDestination.snp.makeConstraints{(maker) in
            maker.top.equalTo(toText.snp.top)
            maker.leading.equalTo(toText.snp.trailing).offset(10)
            maker.trailing.bottom.equalToSuperview().inset(10)
        }
        
        deliverText.snp.makeConstraints{(maker) in
            maker.top.leading.equalToSuperview().offset(10)
            maker.trailing.equalToSuperview().inset(10)
        }
        
        goodImageView.snp.makeConstraints{(maker) in
            maker.width.equalTo(goodImageView.snp.height).multipliedBy(1.0 / 1.0)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(deliverText.snp.bottom).offset(15)
            maker.bottom.equalToSuperview().inset(15)
            
        }
    }

}
