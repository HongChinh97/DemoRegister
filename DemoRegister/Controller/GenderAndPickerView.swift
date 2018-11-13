//
//  GenderButton.swift
//  DemoRegister
//
//  Created by admin on 10/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import os.log
class GenderAndPickerView: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
   
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var index : [IndexPath]?
    var numberAge = Array(0...100)
    var selectedAge: Int = 18

    var gender: Gender? {
        didSet {
            guard gender != nil else {
                return
            }
            for button in genderButtons {
                if button.tag == gender!.rawValue{
                    button.isSelected = true
                }
            }
        }
    }
    
    @IBOutlet weak var registration: UIButton!
    @IBAction func registration(_ sender: UIButton) {
    }
    @IBOutlet weak var pickerView: UIPickerView!
    //keo outlet cua ca 3 button vao trong kieu mang
    @IBOutlet var genderButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        //kiem tra tuoi duoc chon
        loadUserInfo()
        pickerView.selectRow(selectedAge, inComponent: 0, animated: true)
        //vo hieu hoa nut registration neu khong chon vao gender
        registration.isEnabled = false
    }
    
    func loadUserInfo() {
        //vi tri xuat hien mac dinh la 18 trong picker view
        if UserDefaults.standard.integer(forKey: Key.ageKey) == 0 {
            selectedAge = 18
        } else {
            selectedAge = UserDefaults.standard.integer(forKey: Key.ageKey)
        }
        //kiem tra xem co du lieu tag gender bang 1,2,3 neu khong co cac gia tri duoc chon nay se khong co du lieu
        let gender = UserDefaults.standard.integer(forKey: Key.genderKey)
        self.gender = Gender(rawValue: gender)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //keo 3 outlet cua button vao action roi cho selected bang false cai nao duoc chon se la true
    @IBAction func genderButton(_ sender: UIButton) {
        for button in genderButtons {
            button.isSelected = false
        }
        sender.isSelected = true
        //nut registration da duoc chon sang len
        registration.isEnabled = true
        //luu cac gender duoc gan co va key
        UserDefaults.standard.set(sender.title(for: .selected), forKey: Key.genderKey)
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
    
    //xet gia tri kieu int khong phai string
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(numberAge[row], forKey: Key.ageKey)
    }
    
}
