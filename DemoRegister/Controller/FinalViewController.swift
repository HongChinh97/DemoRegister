//
//  FinalViewController.swift
//  DemoRegister
//
//  Created by admin on 10/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    var window: UIWindow?
    //nut cancel hien len gan gia tri bang false
    var isShowRightBarBtn: Bool = false
    @IBOutlet weak var cancelBarBtn: UIBarButtonItem!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var labelDistrict: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBarBtn.isEnabled = isShowRightBarBtn
        getData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelBarBtn(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // controller identifier sets up in storyboard utilities
        // panel (on the right), it called Storyboard ID
        if let cityTableViewController = storyboard.instantiateViewController(withIdentifier: "CityTableViewController") as? CityTableViewController {
            //xoa het cac du lieu da duoc chon o man cuoi cung
            UserDefaults.standard.removeObject(forKey: Key.genderKey)
            let navigation = UINavigationController(rootViewController: cityTableViewController)
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()
        }
    }
    
    func getData() {
        if let cityName = UserDefaults.standard.object(forKey: Key.cityKey) as? String {
            print(cityName)
            label1.text = cityName
        }
        if let districtName = UserDefaults.standard.object(forKey: Key.districtKey) as? String {
            labelDistrict.text = districtName
        }
        if let ageName = UserDefaults.standard.object(forKey: Key.ageKey)  as? Int {
            
            labelAge.text = String(ageName)
        }
        if let genderName = UserDefaults.standard.object(forKey: Key.genderKey) as? String {
            labelGender.text = genderName
        }
    }
//    func exists() ->Bool {
//        return (UserDefaults.standard.object(forKey: Key.cityKey ) != nil)
////        return((UserDefaults.standard.object(forKey: Key.districtKey) != nil))
//    }
    
}
