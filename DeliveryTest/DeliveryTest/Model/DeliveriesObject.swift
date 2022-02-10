//
//  DeliveriesObject.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 7/1/2022.
//

import Foundation
import ObjectMapper
import RealmSwift

class DeliveriesObject: Object, Codable{
    @objc dynamic var id : String?
    @objc dynamic var remarks : String?
    @objc dynamic var pickupTime : String?
    @objc dynamic var goodsPicture : String?
    @objc dynamic var deliveryFee : String?
    @objc dynamic var surcharge : String?
    let  bookmarked : Bool?
    @objc dynamic var route : Route?
    @objc dynamic var sender : Sender?
    
    override static func primaryKey() -> String? {
      return "id"
    }
    
    func getTotalcharge() -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.usesSignificantDigits = true
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.locale = Locale(identifier: "es_US")
        let deFee = numberFormatter.number(from: deliveryFee ?? "$0")
        let surFee = numberFormatter.number(from: surcharge ?? "$0")
        let totalCharge = (deFee?.doubleValue ?? 0) + (surFee?.doubleValue ?? 0)
        return numberFormatter.string(from: NSNumber(value: totalCharge)) ?? "$0"
    }
    
    
//    func getRoute() -> TestRoute{
//        return route ?? TestRoute(from: <#Decoder#>)
//    }
    
    func getStart() -> String{
        return route?.getStart() ?? ""
    }
    
    func getEnd() -> String{
        return route?.getEnd() ?? ""
    }
    
//    func getSender() -> TestSender{
//        return sender ?? TestSender()
//    }
    
    func getGoodPics() -> String{
        return goodsPicture ?? ""
    }
    
    func getPhone() -> String{
        return sender?.getPhone() ?? ""
    }
    
    func getName() -> String{
        return sender?.getName() ?? ""
    }
    
    func getEmail() -> String{
        return sender?.getEmail() ?? ""
    }
}
class Route :  Object, Codable{
    
    @objc dynamic var start : String?
    @objc dynamic var end : String?
    
    func getStart() -> String{
        return start ?? ""
    }
    
    func getEnd() -> String{
        return end ?? ""
    }
}

class Sender :  Object, Codable{
    
    @objc dynamic var phone : String?
    @objc dynamic var name : String?
    @objc dynamic var email : String?
    
    func getPhone() -> String{
        return phone ?? ""
    }
    
    func getName() -> String{
        return name ?? ""
    }
    
    func getEmail() -> String{
        return email ?? ""
    }
}
