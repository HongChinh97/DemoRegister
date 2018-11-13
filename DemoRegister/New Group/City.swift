//
//  City.swift
//  DemoRegister
//
//  Created by admin on 9/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
//bien goi kieu dictionary bat cu dau
typealias DICT = Dictionary<AnyHashable, Any>
class City {
    let cityCode: Int
    let name: String
    init(dictionary: DICT) {
        //c1 khai bao do apple dinh nghia mot cach an toan cho nguoi dung
//        guard let cityCode = dictionary["CityCode"] as? Int else {return nil}
//        guard let name = dictionary["Name"] as? String else {return nil}
        //c2 khai bao co the sai du lieu, neu du lieu sai van duoc su dung
//        let cityCode = dictionary["CityCode"] as? Int ?? -999
//        let name = dictionary["Name"] as? String ?? "-999"
//        self.cityCode = cityCode
//        self.name = name
        //c3 du lieu do minh tao ra neu sai minh co the thay doi du lieu truc tiep tai vi tri sai
        cityCode = dictionary["CityCode"] as! Int
        name = dictionary["Name"] as! String
    }
}
