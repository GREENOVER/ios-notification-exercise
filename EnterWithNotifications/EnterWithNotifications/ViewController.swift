import UIKit
import UserNotifications

class ViewController: UIViewController {
    let content = UNMutableNotificationContent()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in print(didAllow) })
        
        configureNotification()
        deliverNotification()
    }
    
    func configureNotification() {
        content.title = "Notificaion 푸시 알림 테스트!!"
        content.body = "Notification 푸시 알림 테스트중입니다!!"
    }

    func deliverNotification() {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "Second", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let nofiticationInfo = response.notification.request.content.userInfo
        let viewName = nofiticationInfo["target_view"] as! String
        self.tabBarController?.selectedIndex = 1
        navigationController?.pushViewController(YellowViewController(), animated: true)
    }
}

