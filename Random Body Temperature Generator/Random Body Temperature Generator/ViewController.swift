//
//  ViewController.swift
//  Random Body Temperature Generator
//
//  Created by Martin Cao on 2021/7/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempButton: UIButton!
    

    @IBAction func generateTemp(_ sender: UIButton) {
        updateUI()
    }
    
    var tempList:[Double] = [] // A temperature list to avoid recurring.

    func generateTemp() -> Double { // The function that actually generate the temperature.
        let dTemp = Int.random(in: 0 ... 10)
        let tempInt = (basicTemp + dTemp)
        let temp = Double(tempInt) / 10
        //print(temp)
        return temp
    }

    let basicTemp = 357 // The lowest temperature.

    func rmTemp() {
        if tempList.count > 3 { // To avoid OOM
            tempList.remove(at: 0)
        }
    }
    
    func updateTemp() -> Double {
        let temp0 = generateTemp()
        tempList.append(temp0)
        rmTemp()
        return temp0
    }
    
    func updateUI() {
        tempLabel.text = String(updateTemp())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    

}

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

