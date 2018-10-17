//
//  DetailTableViewController.swift
//  DemoRegister
//
//  Created by admin on 9/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var newcityCode: Int?
    var dataDistrict : [District] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        DataServive.shared.getDataDistrict()
        
        if let districtCode = newcityCode  {
           dataDistrict = DataServive.shared.syncDataCityDistrict(dataCityCode: districtCode)
//            saveDistrict()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDistrict.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath)

        cell.textLabel?.text = dataDistrict[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(DataServive.shared.dataDistricts[indexPath.row].name, forKey: Key.districtKey)
    }
    
}
