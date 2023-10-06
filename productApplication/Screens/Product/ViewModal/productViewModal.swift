//
//  productViewModal.swift
//  productApplication
//
//  Created by STC on 06/10/23.
//

import Foundation
final class productViewModal{
    var products1 : [Products] = []
    var eventHandler : ((_ event: Event) -> Void)?
    
    func fechProducts(){
        self.eventHandler.self?(.loading)
        ApiManager.shared.fetchingApi { responnce in
            self.eventHandler?(.stopLoading)
            switch responnce{
            case .success(let products1) :
            
                self.products1 = products1.products.self
             // print(products1)
                self.eventHandler?(.dataLoaded)
            case .failure(let error) :
                print(error)
                self.eventHandler?(.error(_error: error))
            }
        }
    }
}
extension  productViewModal{
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(_error : Error?)
    }
}
