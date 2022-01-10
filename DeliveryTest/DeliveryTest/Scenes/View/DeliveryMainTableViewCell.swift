//
//  DeliveryMainTableViewCell.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 6/1/2022.
//

import UIKit
import Kingfisher
import SnapKit

class DeliveryMainTableViewCell: UITableViewCell {

    static let cell = "DeliveryMainTableViewCell"
    
    let cellContentView: UIView = {
        let v = UIView()
//        v.roundCorners(.allCorners, radius: 25)
        v.backgroundColor = UIColor.white
//        v.roundCorners(cornerRadius: 20)
        v.layer.applySketchShadow(
            color: .black,
                alpha: 0.3,
                x: 0,
                y: 0,
                blur: 4,
            spread: 0)

        return v
    }()
    
    let cellImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person.and.person.fill")
        iv.contentMode = .scaleAspectFit
        return iv
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
    
    let deliveryPrice: UILabel = {
       let lbl = UILabel()
        lbl.font = .regular16
        lbl.text = "$213121"
        lbl.textAlignment = .right
//        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let bookmarkIcon: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "heart.circle.fill")
        iv.tintColor = .red
        iv.contentMode = .scaleAspectFit
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
        contentView.addSubviews(cellContentView)
    
        self.selectionStyle = .none
        cellContentView.addSubviews(
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
        
        cellContentView.snp.makeConstraints{(maker) in
            maker.top.leading.equalToSuperview().offset(10)
            maker.trailing.bottom.equalToSuperview().inset(10)
        }
        
        cellImage.snp.makeConstraints{(maker) in
            maker.size.equalTo(CGSize(width: 80, height: 80))
            maker.leading.equalToSuperview().inset(15)
            maker.centerY.equalToSuperview()
//            maker.top.equalToSuperview().offset(10)
//            maker.bottom.equalToSuperview().inset(10)
        }
        
        fromText.snp.makeConstraints{(maker) in
//            maker.size.equalTo(CGSize(width: 50, height: 20))
            maker.leading.equalTo(cellImage.snp.trailing).offset(15)
            maker.top.equalToSuperview().offset(10)
        }
        
        toText.snp.makeConstraints{(maker) in
            maker.size.equalTo(fromText.snp.size)
            maker.leading.equalTo(cellImage.snp.trailing).offset(15)
            maker.top.equalTo(deliveryStartFrom.snp.bottom).offset(12)
        }
        
        deliveryStartFrom.snp.makeConstraints{(maker) in
            maker.leading.equalTo(fromText.snp.trailing).offset(5)
            maker.trailing.equalTo(deliveryPrice.snp.leading).offset(20)
//            maker.size.width.greaterThanOrEqualTo(80)
            maker.top.equalTo(fromText.snp.top)
        }
        
        deliveryDestination.snp.makeConstraints{(maker) in
            maker.leading.equalTo(toText.snp.trailing).offset(5)
            maker.trailing.equalTo(deliveryPrice.snp.leading).offset(20)
//            maker.size.width.greaterThanOrEqualTo(80)
            maker.top.equalTo(toText.snp.top)
//            maker.bottom.greaterThanOrEqualToSuperview().inset(7)
        }
        
        deliveryPrice.snp.makeConstraints{(maker) in
            maker.top.greaterThanOrEqualTo(bookmarkIcon.snp.bottom).offset(20)
            maker.size.equalTo(CGSize(width: 80, height: 20))
            maker.trailing.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(10)
        }
        
        bookmarkIcon.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().offset(7)
            maker.size.equalTo(CGSize(width: 50, height: 50))
            maker.trailing.equalToSuperview().inset(15)
        }
    
    }
    
    func uiBind(delivery : DeliveriesObject){
//        bookmarkIcon.isHidden = !
        deliveryPrice.text = "$\(delivery.totalCharge)"
        deliveryDestination.text = delivery.route?.end
        deliveryStartFrom.text = delivery.route?.start
        cellImage.kf.setImage(with: URL(string: delivery.goodsPickupPic ?? ""))
        
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
