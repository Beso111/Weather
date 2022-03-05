//
//  ForecastTableViewCell.swift
//  Weather
//
//  Created by beso on 28.02.22.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var temp: UILabel!
    var forecast : List1?{
        didSet{
            temp.text = "\(calculateCelsius(fahrenheit: forecast?.main.temp ?? 0))" + "C°"
            time.text = forecast?.dtTxt
            weather.text = forecast?.weather.first?.weatherDescription ?? ""
        }
        
    }
    
    
    func calculateCelsius(fahrenheit: Double) -> Int {
        var celsius: Double
        
        celsius = (fahrenheit - 32) * 5 / 9
        
        return  Int (celsius)
    }
}
