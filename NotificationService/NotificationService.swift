//
//  NotificationService.swift
//  NotificationService
//
//  Created by Александр Дергилёв on 27.05.2022.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        guard let bestAttemptContent = bestAttemptContent,
        let apsDATA = bestAttemptContent.userInfo["aps"] as? [String: Any],
        let attachmentURLAsString = apsDATA["attachment-url"] as? String,
        let attachmentUrl = URL(string: attachmentURLAsString) else {
            return
        }
        
        downloadImageFrom(url: attachmentUrl) { attachment in
            if attachment != nil {
                bestAttemptContent.attachments = [attachment!]
                contentHandler(bestAttemptContent)
            }
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
// MARK: - Helper functions
extension NotificationService {
    private func downloadImageFrom(url: URL, with completionHandler: @escaping(UNNotificationAttachment?) -> Void) {
        let task = URLSession.shared.downloadTask(with: url) { (downloadUrl, _, _) in
            guard let downloadUrl = downloadUrl else {
                completionHandler(nil)
                return
            }

            var urlPath = URL(fileURLWithPath: NSTemporaryDirectory())
            
            let uniqueURLEnding = ProcessInfo.processInfo.globallyUniqueString + ".png"
            urlPath = urlPath.appendingPathComponent(uniqueURLEnding)
            
            try? FileManager.default.moveItem(at: downloadUrl, to: urlPath)
            
            do {
                let attacment = try UNNotificationAttachment(identifier: "favicon", url: urlPath)
                completionHandler(attacment)
            } catch {
                completionHandler(nil)
            }
        }
        task.resume()
    }
}
