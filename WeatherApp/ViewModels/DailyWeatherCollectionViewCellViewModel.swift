//
//  DailyWeatherCollectionViewCellViewModel.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 24.02.2024.
//

import Foundation
import WeatherKit


struct DailyWeatherCollectionViewCellViewModel{
    private let model : DayWeather
    init(model: DayWeather){
        self.model = model
    }
    static let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        
        return formatter
    }()
    
    public var iconName: String{
        return model.symbolName
    }

    public var temperature : String{
        return "\(model.lowTemperature) - \(model.highTemperature)"
    }
    
    //private func string(for temp: Measurement<UnitTemperature>) -> String{
      //  return "\(Int(temp.converted(to: .fahrenheit).value)) F°"
    //}
    
    public var day : String{
        let day = Calendar.current.component(.weekday, from: model.date)
        return string(from: day)
    }
    private func string(from day: Int) -> String{
       
        switch (day) {
        
        case 1:
            return "Monday"
        case 2:
            return "Tuesday"
        case 3:
            return "Wednesday"
        case 4:
            return "Thursday"
        case 5:
            return "Friday"
        case 6:
            return "Saturday"
        case 7:
            return "Sunday"
        default:
            return "Unavailable"
        }
    }
}
