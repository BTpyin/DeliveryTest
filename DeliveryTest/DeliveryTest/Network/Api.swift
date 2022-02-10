//
//  API.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 7/1/2022.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift
import RxCocoa

class Api {
    static let requestBasePath = "https://mock-api-mobile.dev.lalamove.com"
    
    static let getDeliveries = "/v2/deliveries"

  
  // MARK: - Common
//  func stopAllRunningRequest() {
//    Alamofire.SessionManager.default.session.getAllTasks { (tasks) in
//      tasks.forEach({ $0.cancel() })
//    }
//  }

    static let manager : Session = {
      //2
        let configuration = URLSessionConfiguration.af.default
      //here do api cert pinning if need
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.urlCache = nil
        configuration.httpAdditionalHeaders = Alamofire.HTTPHeaders.default.dictionary
        return Session(configuration: configuration)
    }()

    
}
