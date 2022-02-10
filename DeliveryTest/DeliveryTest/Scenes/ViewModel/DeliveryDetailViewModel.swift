//
//  DeliveryDetailViewModel.swift
//  DeliveryTest
//
//  Created by Bowie Tso on 10/2/2022.
//

import Foundation
import RxSwift
import Realm
import RxCocoa

class DeliveryDetailViewModel: ViewModelType{
    var disposeBag = DisposeBag()
    
    
    struct Input {
        var delivery = BehaviorRelay<DeliveriesObject?>(value: nil)
    }
    
    struct Output {
        var deliveryFrom = BehaviorRelay<String?>(value: nil)
        var deliveryTo = BehaviorRelay<String?>(value: nil)
    }
    
    struct InOut {
        
    }
    
    var input = Input()
    let output = Output()
    let inOut = InOut()
    
    init(delivery: DeliveriesObject){
        
        input.delivery.subscribe(onNext:{[weak self] _ in
            self?.output.deliveryFrom.accept(self?.input.delivery.value?.getStart() ?? "")
            self?.output.deliveryTo.accept(self?.input.delivery.value?.getEnd() ?? "")
        }).disposed(by: disposeBag)
        
        input.delivery.accept(delivery)
    }
    
}
