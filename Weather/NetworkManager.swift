//
//  NetworkManager.swift
//  Weather
//
//  Created by beso on 27.02.22.
//

import Foundation
struct NetworkManager{
    static func fetchData(completion:@escaping (Welcome)-> Void){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Tbilisi&appid=b0aac1a697669c407fc851f62c265bfb") else {return}
      let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let err = error {
                print(err)
            }
            do{
                guard let data = data else {return}
                let WeatherData = try JSONDecoder().decode(Welcome.self, from: data)
                completion(WeatherData)
                print(WeatherData)
            }catch let error as NSError{
                print(error)
            }
        }
        task.resume()
    }
    static func fetchForecastData(completion1:@escaping(Welcome1)-> Void){
        guard let url1 = URL(string: "https://api.openweathermap.org/data/2.5/forecast?id=611717&appid=29ba79f9fb13f09c397fc1db1ab15a30")
        else {return}
        let task1 = URLSession.shared.dataTask(with: url1) { data1, _, error1 in
            if let err1 = error1{
                print(err1)
            }
            do{
                guard  let data1 = data1 else {
                    return
                }
                let forecastWeather = try JSONDecoder().decode(Welcome1.self,from:data1)
                completion1(forecastWeather)
                

            }catch let error1 as NSError{
                print(error1)
                
            }
        }
        task1.resume()
        
    }
}
