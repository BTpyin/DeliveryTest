//
//  SyncData.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 7/1/2022.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift
import Alamofire
import ObjectMapper
import AlamofireObjectMapper


enum SyncDataFailReason: Error {
  case network
  case realmWrite
  case other
}


class SyncData {
    static var firstSync : Bool  = false
    
    static var realmBackgroundQueue = DispatchQueue(label: ".realm", qos: .background)
    
    static func writeRealmAsync(_ write: @escaping (_ realm: Realm) -> Void,
                                completed: (() -> Void)? = nil) {
      SyncData.realmBackgroundQueue.async {
        autoreleasepool {
          do {
            let realm = try Realm()
            realm.beginWrite()
            write(realm)
            try realm.commitWrite()

            if let completed = completed {
              DispatchQueue.main.async {
                let mainThreadRealm = try? Realm()
                mainThreadRealm?.refresh() // Get updateds from Background thread
                completed()
              }
            }
      } catch {
            print("writeRealmAsync Exception \(error)")
          }
        }
      }
    }
    
    func failReason(error: Error?, resposne: Any?) -> SyncDataFailReason {
      if let error = error as NSError?, error.domain == NSURLErrorDomain {
        return .network
      }
      return .other
    }
    
    func getDeliveries(startFrom: Int, limit: Int, completed:((SyncDataFailReason?) -> Void)?){
        let urlString = "\(Api.requestBasePath)\(Api.getDeliveries)"
        let param : Parameters = [
            "offset" : startFrom,
            "limit": limit
        ]
        Api.manager.request(urlString,
                          method: .get,
                          parameters: param,
                          encoding: URLEncoding.default,
                          headers: nil).response(completionHandler: {dataResponse in
            if let status = dataResponse.response?.statusCode {
                let jsonDecoder = JSONDecoder()
                    switch(status) {
                       case 200:
                        var data: [DeliveriesObject]?
                        do {
                            data = try jsonDecoder.decode([DeliveriesObject].self, from: dataResponse.data ?? Data())
                            
                            if let apidata = data {
                                SyncData.writeRealmAsync({(realm) in
                                    realm.add(apidata, update: .all)
                                    
                                }, completed: {
                                    completed?(.realmWrite)
                                })
                            } else {
//                                if let rootViewController = keyWindow?.rootViewController as? BaseViewController{
//                                    rootViewController.stopLoading()
//                                    rootViewController.showAlert("Null Data", okClicked: {_ in
//                                        return
//                                    })
//                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }



                       default:
                        print(dataResponse.error?.localizedDescription)
                        completed?(.network)
                     }
            }
        })
    }
}
