//
//  IAPManager.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 22.02.2024.
//


//TODO: bring in revenueCat
import Foundation
import RevenueCat

final class IAPManager{
    static let shared = IAPManager()
    
    private init() {}
    
    func isSubscribed(completion: @escaping(Bool) -> Void){
        Purchases.shared.getCustomerInfo { info, error in
            guard let subscriptions = info?.activeSubscriptions else { return}
            
            print(subscriptions)
            completion(!subscriptions.isEmpty)
        }
    }
}
