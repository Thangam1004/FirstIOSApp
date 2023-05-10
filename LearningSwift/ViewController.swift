//
//  ViewController.swift
//  LearningSwift
//
//  Created by Thangam on 26/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    var originalPriceValue: Float = 0
    var gstPercentageValue: Float = 0

    @IBOutlet weak var afterGstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    @IBAction func originalPriceChanged(_ sender: UITextField) {
        if let value = Float(sender.text!) {
            originalPriceValue = value
        } else {
            originalPriceValue = 0
        }
        afterGstTextField.text?.removeAll()
    }
    
    @IBAction func gstPercentageChanged(_ sender: UITextField) {
        if let value = Float(sender.text!) {
            gstPercentageValue = value
        } else {
            gstPercentageValue = 0
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        let gstValue = originalPriceValue * gstPercentageValue / 100
        let priceWithGst = originalPriceValue + gstValue
        
        afterGstTextField.text = String(priceWithGst)
    }
    @IBAction func websiteButton(_ sender: UIButton) {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func btnTapped(_ sender: Any) {
        //  *** Navigate using storyboard ***
        
//        let storyBoard = self.storyboard?.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController
//        self.navigationController?.pushViewController(storyBoard, animated: true)
        
        //  *** Navigate using segue ***
        self.performSegue(withIdentifier: "newScreen", sender: self)
    }
    
}
