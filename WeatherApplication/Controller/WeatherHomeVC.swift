//
//  ViewController.swift
//  WeatherApplication
//
//  Created by Thejeswara Reddy on 25/02/21.
//

import UIKit

class WeatherHomeVC: UIViewController {
    
    var weatherData : WeatherCoreData?
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var weatherSearchbar: UISearchBar!
    private let manager = WeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherSearchbar.delegate = self
        weatherSearchbar.showsCancelButton = true
        weatherTableView.dataSource = self
        self.weatherTableView.isHidden = true
        if #available(iOS 13.0, *) {
            weatherTableView.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        print(self.applicationDirectoryPath())
    }
    
    @IBAction func weatherSearchAction(_ sender: UIButton) {
        if weatherSearchbar.text != ""{
            weatherData = manager.getWeatherCity(name: weatherSearchbar.text ?? "")
            if weatherData?.name == nil{
                getWeatherBy(city: weatherSearchbar.text ?? "")
            }else{
                DispatchQueue.main.async {
                    self.weatherTableView.reloadData()
                }
                self.weatherTableView.isHidden = false
            }
        }else{
            self.weatherTableView.isHidden = true
            showAlert(byAlert: "Please enter city name")
        }
    }
    //Get Directorypath
    func applicationDirectoryPath() -> String {
            return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String
        }
    func insertInto(model : WeatherModel){
        let weather = WeatherCoreData()
        weather.base = model.base
        weather.id = model.id
        weather.name = model.name
        weather.cod = model.cod
        weather.dt = model.dt
        weather.timezone = model.timezone
        weather.visibility = model.visibility
        weather.mainfeelslike = model.main.feels_like
        weather.mainhumidity = Double(model.main.humidity)
        weather.winddeg = Double(model.wind.deg)
        weather.windspeed = model.wind.speed
        weather.sysunset = Double(model.sys.sunset)
        weather.sysunrise = Double(model.sys.sunrise)
        let result = manager.createWeatherByCity(record: weather)
        if(result == true)
        {
            debugPrint("record saved successfully")
            DispatchQueue.main.async {
                self.weatherData = self.manager.getWeatherCity(name: self.weatherSearchbar.text ?? "")
                self.weatherTableView.isHidden = false
                self.weatherTableView.reloadData()
            }
        }
        else
        {
            debugPrint("Create failed")
        }
    }
    // get weather deatils by city
    func getWeatherBy(city name:String){
        AppServerClient.shared.getWeatherData(city: name) {  [weak self] result in
            switch result{
            case .success(let response):
                print("Response \(response)")
                self?.insertInto(model: response)
            break
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.showAlert(byAlert: "Incorrect city name")
                    self?.weatherTableView.isHidden = true
                }
            break
            }
        }
    }
}
extension WeatherHomeVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let weatherTimeCell = tableView.dequeueReusableCell(withIdentifier: "timeTableViewCell", for: indexPath) as? TimeTableViewCell{
                weatherTimeCell.backgroundColor = UIColor.green
                return weatherTimeCell
            }
        }else if indexPath.row == 1{
            if let dayTableCell = tableView.dequeueReusableCell(withIdentifier: "dayTableViewCell", for: indexPath) as? DayTableViewCell{
                return dayTableCell
            }
        }else if indexPath.row == 2{
            if let dataTableCell = tableView.dequeueReusableCell(withIdentifier: "dataTableViewCell", for: indexPath) as? DataTableViewCell{
                dataTableCell.cityDetails(cityDetails: weatherData)
                return dataTableCell
            }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 130.0
        }else{
            return 300.0
        }
    }
}
extension WeatherHomeVC{
    func showAlert(byAlert message:String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension WeatherHomeVC:UISearchBarDelegate,UISearchControllerDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.weatherTableView.isHidden = true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            self.weatherTableView.isHidden = true
        }
    }
}
