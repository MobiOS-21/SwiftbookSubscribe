//
//  NotificationViewController.swift
//  NotificationContent
//
//  Created by Александр Дергилёв on 27.05.2022.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    @IBOutlet weak var likeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNotificationCategories()
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        switch response.actionIdentifier {
        case "Snooze":
            let actions = [
                UNNotificationAction(identifier: "5 seconds", title: "Delay for 5 seconds", options: []),
                UNNotificationAction(identifier: "10 seconds", title: "Delay for 10 seconds", options: []),
                UNNotificationAction(identifier: "60 seconds", title: "Delay for 60 seconds", options: [])
                ]
            
            extensionContext?.notificationActions = actions
            
        case "5 seconds":
            reminder(timeInterval: 5)
            dismissNotification()
        case "10 seconds":
            reminder(timeInterval: 10)
            dismissNotification()
        case "60 seconds":
            reminder(timeInterval: 60)
            dismissNotification()
        case "Dismiss":
            dismissNotification()
        default:
            dismissNotification()
        }
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        likeButton.setTitle("💚", for: .normal)
    }
    
    @IBAction func openAppButton(_ sender: Any) {
        openApp()
    }
    
    func openApp() {
        extensionContext?.performNotificationDefaultAction()
    }
    
    func dismissNotification() {
        extensionContext?.dismissNotificationContentExtension()
    }
    
    func setNotificationCategories() {
        let actions = [
            UNNotificationAction(identifier: "Snooze", title: "Snooze", options: []),
            UNNotificationAction(identifier: "Dismiss", title: "Dismiss", options: [.destructive])
        ]
        
//        let category = UNNotificationCategory(identifier: "User Action", actions: actions, intentIdentifiers: [], options: [])
        let category = UNNotificationCategory(identifier: "User Action",
                                              actions: actions,
                                              intentIdentifiers: [],
                                              hiddenPreviewsBodyPlaceholder: nil,
                                              categorySummaryFormat: "%u новых уведомлений в разделе %@")
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
    
    func reminder(timeInterval: Double) {
        let content = UNMutableNotificationContent()
        
        content.title = "Reminder"
        content.body = "Code time"
        content.sound = .default
        content.categoryIdentifier = "User Action"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: "Local notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("error \(error)")
            }
        }
    }
}
