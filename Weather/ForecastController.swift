//
//  ForecastController.swift
//  Weather
//
//  Created by beso on 28.02.22.
//

import UIKit

class ForecastController: UIViewController {
    @IBOutlet weak var tableview : UITableView!
    
    var forecast :[Welcome1?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        
        NetworkManager.fetchForecastData { tralivali1 in
            DispatchQueue.main.async {
                self.forecast.append(tralivali1)
                self.tableview.reloadData()

            }
        }

    }
    
}

extension ForecastController : UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.forecast.first??.list.count ?? 0
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell",for :indexPath) as? ForecastTableViewCell else {fatalError()}
        let currentForecast = self.forecast.first??.list[indexPath.row]
        cell.forecast = currentForecast
        return cell
    }
    
    
}
