//
//  AppDelegate.swift
//  DemoRegister
//
//  Created by admin on 9/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //neu du lieu duoc luu thi chay luon vao man cuoi, khong thi chay luon vao man dau tien
        if UserDefaults.standard.object(forKey: Key.genderKey) != nil {
            //In project directory storyboard looks like Main.storyboard,
            //    you should use only part before ".storyboard" as it's name,
            //     so in this example name is "Main".
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // controller identifier sets up in storyboard utilities
            //  panel (on the right), it called Storyboard ID
            if let finalViewController = storyboard.instantiateViewController(withIdentifier: "FinalViewController") as? FinalViewController {
                finalViewController.isShowRightBarBtn = true
                let navigation = UINavigationController(rootViewController: finalViewController)
                // Sets our window up in front
                window?.rootViewController = navigation
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}



