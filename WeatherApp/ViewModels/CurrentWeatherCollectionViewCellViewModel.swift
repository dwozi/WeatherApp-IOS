//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 24.02.2024.
//

import Foundation
import WeatherKit


struct CurrentWeatherCollectionViewCellViewModel {
    private let model : CurrentWeather
    init(model: CurrentWeather){
        self.model = model
    }
   
    public var condition: String{
        return model.condition.description
    }
    
    public var temperature : String{
        return model.temperature.description                   //"\(Int(model.temperature.converted(to: .fahrenheit).value))F°"
    }
    public var iconName:String{
        return model.symbolName
    }
}
