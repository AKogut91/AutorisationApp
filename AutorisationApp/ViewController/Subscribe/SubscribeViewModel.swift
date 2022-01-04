//
//  SubscribeViewModel.swift
//  AutorisationApp
//
//  Created by Alex Kogut on 04.01.2022.
//

import Foundation

struct Subscribe {
    var subcribeInfo: [SubscribeInfo] = []
    var subcribePrice: [SubcribePrice] = []
}

struct SubscribeInfo {
    var infoText: String
}

struct SubcribePrice {
    var subcribeMonth: String
    var subcribePrice: String
    var subcribeMonthDetails: String
    var subcribePriceDetails: String
    var subcribeDiscount: String?
}

class SubscribeViewModel {
 
    private var model = Subscribe()
    
    init() {
        model.subcribeInfo = [SubscribeInfo.init(infoText: "Unlimited access to physical activities"),
                              SubscribeInfo.init(infoText: "Library of exclusive podcasts and meditations on sleep, stress, mindfulness, performance, etc."),
                              SubscribeInfo.init(infoText: "Mood check-ins"),
                              SubscribeInfo.init(infoText: "Personal growth tracking"),
                              SubscribeInfo.init(infoText: "Everyday Journal")]
        
        model.subcribePrice = [SubcribePrice.init(subcribeMonth: "1 month", subcribePrice: "12,99 USD", subcribeMonthDetails: "Monthly subcription", subcribePriceDetails: "12,99 USD / per month", subcribeDiscount: nil),
                               SubcribePrice.init(subcribeMonth: "1 year", subcribePrice: "67,99 USD", subcribeMonthDetails: "Yearly subcription", subcribePriceDetails: "10,99 USD / per month", subcribeDiscount: "-13%")]
    }
    
    func getModel() -> Subscribe {
        return model
    }
}
