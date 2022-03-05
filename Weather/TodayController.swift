//
//  TodayController.swift
//  Weather
//
//  Created by beso on 27.02.22.
//

import UIKit

class TodayController: UIViewController {
    @IBOutlet var City : UILabel!
    @IBOutlet var Celsius : UILabel!
    @IBOutlet var Humidity : UILabel!
    @IBOutlet var WindSpeed : UILabel!
    var weather : [Welcome] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.fetchData {tralivali in
           
                self.weather.append(tralivali)
            
            DispatchQueue.main.async { [weak self] in
                self?.City.text = self?.weather.first?.city.name
                var celsius = self?.calculateCelsius(fahrenheit: self?.weather.first?.list.first?.main.temp ?? 0.0)
                var desc = self?.weather.first?.list.first
                var desc2 = desc?.weather.first?.weatherDescription ?? ""
                self?.Celsius.text = String (Int(celsius ?? 0.0)) + "C°" + " " + desc2
                self?.Humidity.text = String (self?.weather.first?.list.first?.main.humidity ?? 6)
                self?.WindSpeed.text = String (self?.weather.first?.list.first?.wind.speed ?? 12) + "km/h"
                
            }
            
    }

}
    func calculateCelsius(fahrenheit: Double) -> Double {
        var celsius: Double
        
        celsius = (fahrenheit - 32) * 5 / 9
        
        return celsius
    }
}
