//
//  AppDelegate.swift
//  WKFortune
//
//  Created by Stephen on 19/10/2015.
//  Copyright © 2015 lumiator.technology.com. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    var window: UIWindow?
    var vc:ViewController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        if (WCSession.isSupported()){
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            
            if session.paired != true {
                print("Apple watch is not paired")
            }
            
            if session.watchAppInstalled != true {
                print("WatchConnectivity is not supported on this device")
            }
        }
        vc = application.windows[0].rootViewController as? ViewController
        return true
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        var function: Int! = 0
        if let input = message as? [String : Int] {
            function = input["function"] as Int!
        }
        
        switch(function) {
        case 1:
            let result = vc?.generateFortune()
            var fortuneDict = Dictionary<String, String>()
            fortuneDict["fortune"] = result
            replyHandler(fortuneDict)
            break;
        default:
            print("Error: Unknown WatchKit App function")
        }
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

