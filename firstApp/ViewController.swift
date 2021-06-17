//
//  ViewController.swift
//  firstApp
//
//  Created by Ilya Zhdaney on 17.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var heigthValue: UITextField!
    @IBOutlet weak var weigthValue: UITextField!
    @IBOutlet weak var genderValue: UISegmentedControl!
    @IBOutlet weak var calcBtn: UIButton!
    @IBOutlet weak var bmiResult: UILabel!
    @IBOutlet weak var bmiResultText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func pushCalcBtn(_ sender: UIButton) {
        let isVerify:Bool = verifyValue()
        
        let age:Int = Int(ageText.text!) ?? 0
        

        let h:Double = Double(heigthValue.text!) ?? 0
        let w:Double = Double(weigthValue.text!) ?? 0
        
        var bmi = 0.00
        
        if isVerify{
            let h2:Double = h / 100
            bmi = w / (h2 * h2)
            bmi = (bmi * 1000).rounded() / 1000
            bmiResult.text = String(bmi)
            bmiResultText.isHidden = false
        }
        
        
        
        
        if isVerify && bmi > 0
        {
            if age <= 18{
                bmiResult.text = String(0.00)
                bmiResultText.text = "You must be over 18 years old."
                bmiResultText.textColor = .red
                
            }
            else {
                
                if bmi <= 18{
                    bmiResultText.text = "Underweight"
                    bmiResultText.textColor = .orange
                }
                else if (bmi > 18 && bmi < 25){
                    bmiResultText.text = "Normal"
                    bmiResultText.textColor = .green
                }
                else{
                    bmiResultText.text = "Overweight"
                    bmiResultText.textColor = .red
                }
              }
            }
    }
        
    
    func verifyValue () -> Bool{
        var isVerify:Bool = false
        
        if ageText.text != ""{
             
            isVerify = true
        }
        else{
         
            isVerify = false
        }
        
        if heigthValue.text != ""{
             
            isVerify = true
        }
        else{
         
            isVerify = false
        }
        
        if weigthValue.text != ""{
             
            isVerify = true
        }
        else{
         
            isVerify = false
        }
        
        return isVerify
        
    }


}

