//
//  LacunchManager.swift
//  Cashmix
//
//  Created by Liseami on 2021/11/12.
//

import Foundation

class LaunchManager : ObservableObject {
    
    static let shared = LaunchManager()
    let userDefaults = UserDefaults.standard
    
    func firstLaunchTest() {
        
        if userDefaults.bool(forKey: "First Launch") == true{
            //不是第一次启动
            
            //增加启动次数
            let launchtime = userDefaults.integer(forKey: "Launch Time") + 1
            userDefaults.set(launchtime, forKey: "Launch Time")
            
            print("App第\(userDefaults.integer(forKey: "Launch Time"))次启动")
            
        }else{
            //第一次启动
            userDefaults.set(false, forKey: "iCloudContent")
            
            userDefaults.set("block",forKey: "FilmListModule")
            
            //颜色模式
//            userDefaults.set(2, forKey: "Color Scheme")
            
            
            // 创建 "Launch Time" 设置为 1
            userDefaults.set(1, forKey: "Launch Time")
            // 创建 启动动画 设置为 true
            userDefaults.set(true, forKey: "Launch Animation")
//            // 创建 登陆页面 设置为 true
//            userDefaults.set(true, forKey: "WellCome Views")
            // 创建 第一次启动 设置为 true
            userDefaults.set(true, forKey: "First Launch")
//            // iCloud存储默认为关，会员才可以打开
//            userDefaults.set(false, forKey: "iCloud connect")
            //设置会员身份为false
            userDefaults.set(false, forKey: "Premium version")
            
            print("App第\(userDefaults.integer(forKey: "Launch Time"))次启动")
        }
    }
    
}
