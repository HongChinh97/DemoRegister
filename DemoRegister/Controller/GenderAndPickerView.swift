//
//  GenderButton.swift
//  DemoRegister
//
//  Created by admin on 10/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

enum Gender: Int {
    case male = 0
    case female = 1
    case other = 2
}

class GenderButton: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    var index : [IndexPath]?
    var numberAge = Array(0...100)
    
    @IBAction func registration(_ sender: UIButton) {
        
    }
    @IBOutlet weak var pickerView: UIPickerView!
    //keo outlet cua ca 3 button vao trong kieu mang
    @IBOutlet var gender: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        //vi tri xuat hien mac dinh la 18 trong picker view
        pickerView.selectRow(18, inComponent: 0, animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //keo 3 outlet cua button vao action roi cho selected bang false cai nao duoc chon se la true
    @IBAction func genderButton(_ sender: UIButton) {
        for button in gender {
            button.isSelected = false
        }
        sender.isSelected = true
        UserDefaults.standard.set(<#T##value: Int##Int#>, forKey: <#T##String#>)
        //        UserDefaults.standard.set(gender, forKey: Key.genderKey)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberAge.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(pickerView.selectedRow(inComponent: 0))
        return String(numberAge[row])
    
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        UserDefaults.standard.set(String(numberAge[row]), forKey: Key.ageKey)
    }
   

    
    

}
