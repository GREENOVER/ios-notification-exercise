import UIKit
import UserNotifications

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in print(didAllow) })
        
        configureNotification()
    }
    
    func configureNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Notificaion 푸시 알림 테스트!!"
        content.subtitle = "Notification 푸시 알림이다요!"
        content.body = "Notification 푸시 알림 테스트중입니다!!"
        content.badge = 10
        
        let imageName = "green"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: ".png") else { return }
        
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        content.attachments = [attachment]
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "Second", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

