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
    var addit = ""
    var yum = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<food.count{
            let menui = food[i]
            let pric = prices[i]
            yum += "\n\(menui), $\(pric)"
            munchMenu.text = yum
        }
    }
    var food = ["HotDog", "Cheese Burger" , "Chicken" , "Salad","Pretzels"]
        var prices =  [3.50,4.00,3.75,3.00,2.00]
    
    
    @IBAction func addMunch(_ sender: Any) {
        var munch = munchField.text!
        var quantity = quanitit.text!
        var cart = [munch : quantity]
      
       
        if food.contains(munch){
            addit += "\n\(cart)"
            cartView.text = addit
            let indexof = Int(exactly: food.firstIndex(of: munch)!)!
            var prp = prices[indexof]
            var quant = Double(quantity)
            var yessuh =  prp * quant!
            total.text = "$\(yessuh)"
        }
        else{
            inCorrectlLbl.text = "Not On Menu"
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

