//
//  DeliveriesObject.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 7/1/2022.
//

import Foundation
import ObjectMapper
import RealmSwift

class DeliveriesObject : Object, Mappable{
    
    @objc dynamic var id : String?
    @objc dynamic var remarks : String?
    @objc dynamic var pickupTime = Date()
    @objc dynamic var goodsPickupPic : String?
    @objc dynamic var deliveryFee : String?
    @objc dynamic var surcharge : String?
    
    @objc dynamic var totalCharge : Double = 0
    @objc dynamic var bookmarked : Bool = false
    
    @objc dynamic var route : Route?
    @objc dynamic var sender : Sender?
    
    override static func primaryKey() -> String? {
      return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        
        id <- map["id"]
        remarks <- map["remarks"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        var tmpDate = ""
        tmpDate <- map["pickupTime"]
        pickupTime = dateFormatter.date(from: tmpDate) ?? Date()
        
        goodsPickupPic <- map["goodsPicture"]
        deliveryFee <- map["deliveryFee"]
        surcharge <- map["surcharge"]
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .currency
        let delivery = numFormatter.number(from: deliveryFee ?? "")?.doubleValue
        let survice = numFormatter.number(from: surcharge ?? "")?.doubleValue
        
        totalCharge = (delivery ?? 0 ) + (survice ?? 0)

 
        route <- map["route"]
        sender <- map["sender"]
        
    }
}

class Route : Object, Mappable{
    
    @objc dynamic var start : String?
    @objc dynamic var end : String?
    
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        start <- map["start"]
        end <- map["end"]
    }
}

class Sender : Object, Mappable{
    
    @objc dynamic var phone : String?
    @objc dynamic var name : String?
    @objc dynamic var email : String?
    
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        phone <- map["phone"]
        name <- map["name"]
        email <- map["email"]
    }
}
