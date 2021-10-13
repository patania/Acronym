//
//  AppDelegate.swift
//  Acronym
//
//  Created by Albert Patania on 10/04/21.
//

import UIKit

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 13.0, *) {
                        window?.overrideUserInterfaceStyle = .light
                        
                    } else {
                        UIApplication.shared.statusBarStyle = .default
                        //window?.overrideUserInterfaceStyle = .
                        // Fallback on earlier versions
                    }
        return true
    }

    // MARK: UISceneSession Lifecycle

  /*  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }*/
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
      // If you are receiving a notification message while your app is in the background,
      // this callback will not be fired till the user taps on the notification launching the application.
      // TODO: Handle data of notification

      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)

      // Print message ID.
    /*  if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID 1: \(messageID)")
      }

      // Print full message.
      print(userInfo)*/
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      // If you are receiving a notification message while your app is in the background,
      // this callback will not be fired till the user taps on the notification launching the application.
      // TODO: Handle data of notification
      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)
      // Print message ID.
     /* if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID 2: \(messageID)")
      }

      // Print full message.
      print(userInfo)*/

      completionHandler(UIBackgroundFetchResult.newData)
    }
   /* func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }*/

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
     //  print("Unable to register for remote notifications: \(error.localizedDescription)")
     }

     // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
     // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
     // the FCM registration token.
     func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      // print("APNs token retrieved: \(deviceToken)")

       // With swizzling disabled you must set the APNs token here.
       // Messaging.messaging().apnsToken = deviceToken
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

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also
    }

}

