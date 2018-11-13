//
//  District.swift
//  DemoRegister
//
//  Created by admin on 9/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
class District {
    var cityCode: Int
    var districtCode: Int
    var name: String
    init(dictionary: DICT ) {
        let cityCode = dictionary["CityCode"] as? Int ?? -111
        let districtCode = dictionary["DistrictCode"] as? Int ?? -1111
        let name = dictionary["Name"] as? String ?? "nil"
        self.cityCode = cityCode
        self.districtCode = districtCode
        self.name = name
    }
}
