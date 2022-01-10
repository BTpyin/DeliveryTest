//
//  API.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 7/1/2022.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Api {
    static let requestBasePath = "https://mock-api-mobile.dev.lalamove.com"
    
    static let getDeliveries = "/v2/deliveries"

  
  // MARK: - Common
  func stopAllRunningRequest() {
    Alamofire.SessionManager.default.session.getAllTasks { (tasks) in
      tasks.forEach({ $0.cancel() })
    }
  }

    

    
}
