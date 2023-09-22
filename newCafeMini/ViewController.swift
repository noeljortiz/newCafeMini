//
//  ViewController.swift
//  newCafeMini
//
//  Created by NOEL ORTIZ on 9/20/23.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var munchField: UITextField!
    
    @IBOutlet weak var cartView: UITextView!
    @IBOutlet weak var munchMenu: UITextView!
    
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var inCorrectlLbl: UILabel!
    @IBOutlet weak var quanitit: UITextField!
    
    @IBOutlet weak var sedretField: UITextField!
    
    @IBOutlet weak var bossyBoy: UILabel!
    
    @IBOutlet weak var urItem: UITextField!
    
    @IBOutlet weak var urPrice: UITextField!
    
    var addit = ""
    var yum = ""
    var answer = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<food.count{
            let menui = food[i]
            let pric = prices[i]
            yum += "\n\(menui), $\(pric)"
            munchMenu.text = yum
            
            urItem.delegate = self
            quanitit.delegate = self
            urPrice.delegate = self
            munchField.delegate = self
            
            
            
            
            
        }
    }
    var food = ["HotDog", "Cheese Burger" , "Chicken" , "Salad","Pretzels"]
        var prices =  [3.50,4.00,3.75,3.00,2.00]
    var clicked = -1
    var i = 1
    
    @IBAction func addtoMenu(_ sender: UIButton) {
        
            answer = sedretField.text!
            var itemAdd = urItem.text!
        var priceAdd = urPrice.text!
            if answer == "yes"{
                yum += "\n\(itemAdd), $\(priceAdd)"
                munchMenu.text = yum
                food.append(itemAdd)
                prices.append(Double(priceAdd)!)
            }
            
        }
    

    @IBAction func addMunch(_ sender: Any) {
     
        if clicked < i {
            var munch = munchField.text!
            var quantity = quanitit.text!
            var cart = [munch : quantity]
            clicked += 1
            print(clicked)
            
            if food.contains(munch){
                addit += "\n\(cart)"
                cartView.text = addit
                let indexof = Int(exactly: food.firstIndex(of: munch)!)!
                var prp = prices[indexof]
                var quant = Double(quantity)
                let yessuh =  prp * quant!
                total.text = "$\(yessuh)"
                if cart.keys.contains(munch){
                    inCorrectlLbl.text = "You already have this!"
                }
            }
            else{
                inCorrectlLbl.text = "Not On Menu"
            }
           
        }
    
    }
    
    @IBAction func answerButt(_ sender: UIButton) {
        answer = sedretField.text!
        if answer == "yes"{
            bossyBoy.text = "Only right answer"
        }
        else{
            bossyBoy.text = "try again"
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

