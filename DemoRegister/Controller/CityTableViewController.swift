//
//  MasterTableViewController.swift
//  DemoRegister
//
//  Created by admin on 9/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataServive.shared.getDataCity()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServive.shared.dataCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMaster", for: indexPath)
        cell.textLabel?.text = DataServive.shared.dataCities[indexPath.row].name

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailTableViewController = segue.destination as? DistrictTableViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                detailTableViewController.newcityCode = DataServive.shared.dataCities[indexPath.row].cityCode                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(DataServive.shared.dataCities[indexPath.row].name, forKey: Key.cityKey)
    }

}
