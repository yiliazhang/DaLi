//
//  CityWeatherManager.swift
//  clw
//
//  Created by apple on 2016/10/19.
//  Copyright © 2016年 Datang. All rights reserved.
//

import UIKit
class WeatherManager: NSObject {
    class func loadWeatherData(_ cityName: String, cityID: String, success: ((_ weatherData: [AnyHashable: Any]) -> Void)?, failure: ((_ error: String) -> Void)?) {
        var newID = cityID
        if !cityID.isEmpty, cityID.hasPrefix("CN") {
            newID = newID.substring(from: newID.characters.index(newID.startIndex, offsetBy: 2))
            YILLog.info("cityID:" + newID + "cityName: " + cityName)
        }
        
        if let cachedWeatherDatas = WeatherManager.cachedWeatherDatas {
            let weatherData = cachedWeatherDatas[newID] as! [AnyHashable : Any]
            let tmp = weatherData["wendu"] as! String
            let forcast = weatherData["forecast"] as! [[AnyHashable : Any]]
            let type = forcast[0]["type"] as! String
            
            success?(["type": type, "tmp": tmp])
            let lastTime = weatherData["time"] as! Double
            let now = Date.timeIntervalSinceReferenceDate
            let interval = now - lastTime
            if interval < 3600 {
                return
            }
        }
        
        weatherIn(newID, cityName: cityName) { (response) in
            if response.resultCode == .success {
                if success != nil {
                    success!((response.value?.dictionaryObject)!)
                }
            } else {
                if failure != nil {
                    failure!(response.message)
                }
            }
        }
    }
    
    class func weatherIn(_ cityID: String, cityName: String, completion: @escaping(YILJSONResponse) -> Void) {
        assert(!(cityID.isEmpty && cityName.isEmpty), "参数无效")
        let params = ["city": cityName, "cityid": cityID]
        let url = "http://wthrcdn.etouch.cn/weather_mini"
        var error: String!

        NetworkHelper.actionJSON(url, params: params)

/**
        Just.get(url, params: params, asyncCompletionHandler: { (r) in
            YILLog.info(r.debugDescription)
            guard r.error == nil else {
                error = r.error!.localizedDescription
                yil_mainQueue {
                    completion(YILValueResponse(resultCode: .failure, message: error!))
                }
                return
            }
            
            guard let text = r.text,
                let textData = text.data(using:String.Encoding.utf8)
                else {
                error = "返回不是字符串"
                yil_mainQueue {
                    completion(YILValueResponse(resultCode: .failure, message: error!))
                }
                return
            }
            let jsonOne = try? JSONSerialization.jsonObject(with: textData,
                                                         options:.allowFragments) as! [AnyHashable: Any]
            
            guard let json = jsonOne,
                let data = json["data"] as? [AnyHashable : Any],
            !data.isEmpty else {
                error = "返回内容解析不正确"
                assertionFailure(error!)
                yil_mainQueue {
                    completion(YILValueResponse(resultCode: .failure, message: error!))
                    
                }
                return
            }
            
            YILLog.info("天气结果：" + json.description)
            
            let tmp = data["wendu"] as! String
            let forcast = data["forecast"] as! [[AnyHashable : Any]]
            let type = forcast[0]["type"] as! String
            
            var jsonTwo = data
            let timeInterval = Date.timeIntervalSinceReferenceDate
            jsonTwo["time"] = timeInterval
            var tmpWeatherData: [AnyHashable : Any] = [:]
            for (k, v) in [cityID: jsonTwo] {
                tmpWeatherData[k] = v
            }
            self.saveCachedWeatherDatas(tmpWeatherData)
            yil_mainQueue {
                completion(YILValueResponse(value: ["type": type, "tmp": tmp], resultCode: .success))
            }
        })
        */
    }
    
    
    // MARK: - Get method
    
    class var defaultCityName: String {
//        let commonCities = self.commonCities
        var cityname: String
        if commonCities.count > 0 {
            cityname = commonCities[0]
        } else {
            cityname = "北京"
        }
        return cityname
    }
    
    class var defaultCityID: String {
        return WeatherManager.cityIDOf(defaultCityName)
    }
    
    class var commonCities: [String] {
        let common =  ["北京", "上海", "广州", "深圳", "杭州", "成都", "南京", "西安", "天津"]
        let filePath = URL(fileURLWithPath: cachesPath).appendingPathComponent("commonCities.plist").absoluteString
        if FileManager.default.fileExists(atPath: filePath) {
            var commonCities = NSArray(contentsOfFile: filePath) as! [Any]
            if commonCities.isEmpty {
                commonCities = common
            }
            return commonCities as! [String]
        } else {
            return common
        }
    }
    
    class var hotCities: [String] {
        let filePath = Bundle.main.path(forResource: "hotCities", ofType: "plist")!
        if FileManager.default.fileExists(atPath: filePath) {
            return NSArray(contentsOfFile: filePath) as! [String]
        } else {
            return []
        }
    }
    
    class var allCities: [String] {
        let filePath = Bundle.main.path(forResource: "allCities", ofType: "plist")!
        if FileManager.default.fileExists(atPath: filePath) {
            return NSArray(contentsOfFile: filePath) as! [String]
        } else {
            return []
        }
    }
    
    class var allCitiesDics: [Dictionary<String, String>] {
        let filePath = Bundle.main.path(forResource: "allCitiesDics", ofType: "plist")!
        if FileManager.default.fileExists(atPath: filePath) {
            return NSArray(contentsOfFile: filePath) as! [Dictionary<String, String>]
        } else {
            return []
        }
    }
    
    static var cachedWeatherDatas: [AnyHashable: Any]? = {
        let filePath = CACHES_DIR + "/cachedWeatherData.plist"
        if FileManager.default.fileExists(atPath: filePath) {
            let data = NSDictionary(contentsOfFile: filePath) as! [AnyHashable: Any]
            return data
        } else {
            return nil
        }
    }()
    
    // MARK: - Save method
    class func saveCommonCities(_ commonCities: [String]) {
        let filePath = URL(fileURLWithPath: cachesPath).appendingPathComponent("commonCities.plist").absoluteString
        let commonCities = commonCities as NSArray
        commonCities.write(toFile: filePath, atomically: true)
    }
    
    class func saveCachedWeatherDatas(_ cachedWeatherDatas: [AnyHashable: Any]) {
        let filePath = CACHES_DIR + "/cachedWeatherData.plist"
        let cachedWeatherDatas = cachedWeatherDatas as NSDictionary
        cachedWeatherDatas.write(toFile: filePath, atomically: true)
    }
    
    // MARK: - Tool method
    class func cityIDOf(_ cityname: String) -> String {
        let allCitiesDics = WeatherManager.allCitiesDics
        for i in 0..<allCitiesDics.count {
            let cityDic = allCitiesDics[i] 
            if (cityname == cityDic["city"]) {
                return cityDic["id"]!
            }
        }
        return ""
    }
}
