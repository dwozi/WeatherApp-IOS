//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 22.02.2024.
//
import CoreLocation
import Foundation
import WeatherKit
final class WeatherManager{
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    
    
    public private(set) var currentWeather: CurrentWeather?
    public private(set) var hourlyWeather: [HourWeather] = []
    public private(set) var dailyWeather: [DayWeather] = []
    
    private init() {}
    
    public func getWeather(for location: CLLocation,completion: @escaping ()-> Void){
        
        Task{
            do {
                let result =  try await service.weather(for: location)
              
                self.currentWeather = result.currentWeather
                self.hourlyWeather = result.hourlyForecast.forecast
                self.dailyWeather = result.dailyForecast.forecast
                
                completion()

            }catch{
                print("\n\nError: "+String(describing: error))
            }
        }
    }
}
