//
//  ViewController.swift
//  WeatherApp
//
//  Created by deniss.lobacs on 13/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var newTemp: UILabel!
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTemp.text = "0 ºC"
        newTemp.text = "32.00 ºF"
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        
        let temp = Double(round(slider.value))
        
        switch segmentedControlOutlet.selectedSegmentIndex {
            
        case 0:
            newTemp.text = String(format: "%.2f", fromCelsiusToFahrenheit(celsius: Int(temp))) + " ºF"
        case 1:
            newTemp.text = String(format: "%.2f", fromCelsiusToKelvin(celsius: Int(temp))) + " ºK"
        default:
            break
        }
        
        
    }
    @IBAction func tempConverter(_ sender: Any) {
        let temp = Int(round(slider.value))
         currentTemp.text = String(temp) + " ºC"
        
        if segmentedControlOutlet.selectedSegmentIndex == 0 {
            newTemp.text = String(format: "%.2f", fromCelsiusToFahrenheit(celsius: Int(temp))) + " ºF" } else if segmentedControlOutlet.selectedSegmentIndex == 1{
                newTemp.text = String(format: "%.2f", fromCelsiusToKelvin(celsius: Int(temp))) + " ºK"
            }
    }
    
    
    func fromCelsiusToFahrenheit(celsius: Int) -> Double {
        var f: Double
        f = (Double(celsius) * 1.8 + 32)
        return f
    }
    
    func fromCelsiusToKelvin(celsius: Int) -> Double {
        var k: Double
        k = Double(celsius) + 273.15
        return k
    }
}

