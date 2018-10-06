//
//  DataService.swift
//  DemoRegister
//
//  Created by admin on 9/22/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
class DataServive: NSObject {
    static let shared: DataServive = DataServive()
    private var _dataCities: [City]?
    var dataCities: [City] {
        get{
            if _dataCities == nil {
                getDataCity()
            }
            return _dataCities ?? []
        } set {
            _dataCities = newValue
        }
    }
    
    private var _dataDistricts: [District]?
    var dataDistricts: [District] {
        get{
            if _dataDistricts == nil {
                getDataDistrict()
            }
            return _dataDistricts ?? []
        } set {
            _dataDistricts = newValue
        }
    }
    func getDataCity() {
       dataCities = []
        //lay du lieu trong plist Cities
        if let path = Bundle.main.path(forResource: "Cities", ofType: "plist") {
            //doc du lieu tu plist
            if let arrayData = FileManager.default.contents(atPath: path) {
                guard let plistDict = try! PropertyListSerialization.propertyList(from: arrayData, options: .mutableContainersAndLeaves, format: nil) as? DICT else { return}
                if let value = plistDict["Cities"] as? [DICT] {
                    for aValue in value {
                        let aCity = City(dictionary: aValue)
                        dataCities.append(aCity)
                    }
                }
            }
        }
    }
    
    func getDataDistrict() {
        dataDistricts = []
        //lay du lieu trong plist Cities
        if let path = Bundle.main.path(forResource: "Districts", ofType: "plist") {
            //doc du lieu tu plist
            if let arrayData = FileManager.default.contents(atPath: path) {
                guard let plistDict = try! PropertyListSerialization.propertyList(from: arrayData, options: .mutableContainersAndLeaves, format: nil) as? DICT else { return}
                if let value = plistDict["Districts"] as? [DICT] {
                    for aValue in value {
                        let aDistrict = District(dictionary: aValue)
                        dataDistricts.append(aDistrict)
                    }
                }
            }
        }
    }
    
    //dong bo neu cung cityCode nhan vao thanh pho nao se hien ra cac tinh cua thanh pho do
        func syncDataCityDistrict(dataCityCode: Int) -> [District] {
        var getData: [District] = []
        for code in dataDistricts{
            if dataCityCode == code.cityCode {
                getData.append(code)
            }
        }
        return getData
    }
}
