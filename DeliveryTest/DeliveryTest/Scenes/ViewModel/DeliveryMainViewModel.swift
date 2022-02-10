//
//  DeliveryMainViewModel.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 7/1/2022.
//

import Foundation
import ObjectMapper
import RxSwift
import RxCocoa
import RealmSwift

class DeliveryMainViewModel : ViewModelType{
    
    var disposeBag = DisposeBag()
    
    
    struct Input {
        var deliveryListFromApi : Results<DeliveriesObject>?
    }
    
    struct Output {
        var deliveryListRelay = BehaviorRelay<[DeliveriesObject?]>(value:[])
    }
    
    struct InOut {
        
    }
    
    var input = Input()
    let output = Output()
    let inOut = InOut()
    
    init() {
        syncDelivery(start: 0,limit: 10,completed: {_ in
            self.fetchDeliveryFromRealm()
        })
        
    }
    
    func syncDelivery(start: Int, limit:Int ,completed: ((SyncDataFailReason?) -> Void)?){
        SyncData().getDeliveries(startFrom: start, limit: limit, completed: completed)
    }
    
    func fetchDeliveryFromRealm(){
        input.deliveryListFromApi = try? Realm().objects(DeliveriesObject.self)
        output.deliveryListRelay.accept(input.deliveryListFromApi?.reversed().reversed() ?? [])
    }
}
