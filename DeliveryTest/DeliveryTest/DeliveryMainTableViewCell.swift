//
//  DeliveryMainTableViewCell.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 6/1/2022.
//

import UIKit
import SnapKit

class DeliveryMainTableViewCell: UITableViewCell {

    static let cell = "DeliveryMainTableViewCell"
    
    let cellImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let fromText: UILabel = {
       let lbl = UILabel()
        return lbl
    }()
    
    let toText: UILabel = {
       let lbl = UILabel()
        return lbl
    }()
    
    let deliveryStartFrom: UILabel = {
       let lbl = UILabel()
        return lbl
    }()
    
    let deliveryDestination: UILabel = {
       let lbl = UILabel()
        return lbl
    }()
    
    let deliveryPrice: UILabel = {
       let lbl = UILabel()
        return lbl
    }()
    
    let bookmarkIcon: UIImageView = {
       let iv = UIImageView()
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.selectionStyle = .none
        
        initUI()
        setupBinding()
        initConstraints()
        
    }

    
    func initUI() {
        
        contentView.addSubviews(
            cellImage,
            fromText,
            toText,
            deliveryStartFrom,
            deliveryDestination,
            deliveryPrice,
            bookmarkIcon
        )
        
    }
    
    func setupBinding() {

    }
    
    func initConstraints() {
        
        cellImage.snp.makeConstraints{(maker) in
            maker.snp.size.equalTo(CGSize(width: 50, height: 50))
            maker.leading.equalToSuperview().inset(15)
            maker.centerY.equalToSuperview()
        }
        
        fromText.snp.makeConstraints{(maker) in
            maker.snp.size.equalTo(CGSize(width: 50, height: 20))
            maker.leading.equalTo(cellImage.snp.trailing).offset(15)
            maker.top.equalToSuperview().offset(10)
        }
        
        toText.snp.makeConstraints{(maker) in
            maker.snp.size.equalTo(CGSize(width: 50, height: 20))
            maker.leading.equalTo(cellImage.snp.trailing).offset(15)
            maker.top.equalTo(fromText.snp.bottom).offset(7)
        }
        
        deliveryStartFrom.snp.makeConstraints{(maker) in
            maker.leading.equalTo(fromText.snp.trailing).offset(5)
            maker.size.height.equalTo(fromText.snp.size.height)
            maker.top.equalTo(fromText.snp.top)
        }
        
        deliveryDestination.snp.makeConstraints{(maker) in
            maker.leading.equalTo(toText.snp.trailing).offset(5)
            maker.size.height.equalTo(toText.snp.size.height)
            maker.top.equalTo(toText.snp.top)
        }
        
        deliveryPrice.snp.makeConstraints{(maker) in
            maker.trailing.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(10)
        }
        
        bookmarkIcon.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().offset(7)
            maker.trailing.equalToSuperview().inset(7)
        }
    
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {

    }
}
