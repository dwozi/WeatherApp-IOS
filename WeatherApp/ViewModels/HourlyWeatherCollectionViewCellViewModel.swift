//
//  HourlyWeatherCollectionViewCellViewModel.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 24.02.2024.
//

import Foundation
import WeatherKit


struct HourlyWeatherCollectionViewCellViewModel{
    private let model : HourWeather
   
    init (model : HourWeather){
        self.model = model
    }
    public var iconName : String{
        return model.symbolName
    }
    public var temperature : String{
        return model.temperature.description  //"\(Int(model.temperature.converted(to: .fahrenheit).value)) F°"  //model.temperature.description
    }
    public var hour: String{
        let hour = Calendar.current.component(.hour, from: model.date)
        return "\(hour):00"
    }
}
