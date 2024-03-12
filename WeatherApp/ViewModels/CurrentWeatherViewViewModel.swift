//
//  CurrentWeatherViewViewModel.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 24.02.2024.
//

import Foundation

enum WeatherViewModel{
    case current(viewModel: CurrentWeatherCollectionViewCellViewModel)
    case hourly(viewModels: [HourlyWeatherCollectionViewCellViewModel])
    case daily (viewModels: [DailyWeatherCollectionViewCellViewModel])
}
