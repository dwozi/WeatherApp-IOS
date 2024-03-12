//
//  ViewController.swift
//  WeatherApp
//
//  Created by Hakan Hardal on 21.02.2024.
//
import WeatherKit
import UIKit
import RevenueCatUI
import RevenueCat

class WeatherViewController: UIViewController {

    
    private let primaryView = CurrentWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getLocation()
    
    }
    
    @objc private func didTapUpgrade(){
        //Show paywall
        let vc = PaywallViewController()
        vc.delegate = self
        present(vc,animated: true)
        
    }
    
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            print(String(describing: location))
         
            WeatherManager.shared.getWeather(for: location){ [weak self] in

                DispatchQueue.main.async {
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return}
                    self?.createViewModels(currentWeather: currentWeather)
                }
                
            }
        }
    }

    private func createViewModels(currentWeather: CurrentWeather){
        var viewModels : [WeatherViewModel] = [
            .current(viewModel: .init(model: currentWeather )),
            .hourly(viewModels: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0) })),
        ]
        self.primaryView.configure(with: viewModels)
        
        IAPManager.shared.isSubscribed { [weak self] subscribed in
            if subscribed{
                viewModels.append(
                    .daily(viewModels: WeatherManager.shared.dailyWeather.compactMap({.init(model: $0) }))
                )
                
                DispatchQueue.main.async {
                    self?.primaryView.configure(with: viewModels)
                    self?.navigationItem.rightBarButtonItem = nil
                }
            }else{
                DispatchQueue.main.async {
                    self?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "crown"), style: .done, target: self, action: #selector(self?.didTapUpgrade))
                }
            }
        }
    }

    private func setUpView(){
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        ])
    }
    
}
extension WeatherViewController : PaywallViewControllerDelegate{
    func paywallViewController(_ controller: PaywallViewController, didFinishPurchasingWith customerInfo: CustomerInfo) {
        controller.dismiss(animated: true)
        guard let currentWeather = WeatherManager.shared.currentWeather else { return }
        createViewModels(currentWeather: currentWeather)
        
        
    }
    func paywallViewController(_ controller: PaywallViewController, didFinishRestoringWith customerInfo: CustomerInfo) {
        print("Purchased: \(customerInfo)")
    }
}
