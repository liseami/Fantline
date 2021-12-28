//
//  App.swift
//  TimeMachine (iOS)
//
//  Created by Liseami on 2021/10/1.
//

import Foundation
import UIKit


class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
//        //友盟启动
//        UM_RUN()
//        //AppleStore初始化
//        AppStore_init()
//        //UI调整
        Customappearance()
//
//        //初次登陆检查
        LaunchManager.shared.firstLaunchTest()
//
        
        return true
    }
    
  
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
              return Device.deviceType == .ipad
                  ? UIInterfaceOrientationMask.all
        : UIInterfaceOrientationMask.portrait
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if MobClick.handle(url){
            return true
        }
        return true
    }
    
    //    /// 设置屏幕支持的方向
    //        func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    //            if isForceAllDerictions == true {
    //                return .all
    //            } else if isForceLandscape == true {
    //                return .landscape
    //            } else if isForcePortrait == true {
    //                return .portrait
    //            }
    //            return .portrait
    //        }
    
    
    
}
