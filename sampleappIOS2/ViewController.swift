//
//  ViewController.swift
//  sampleappIOS2
//
//  Created by Subhadip Mondal on 18/03/24.
//

import UIKit
import VerloopSDKiOS
import VerloopSDKiOS

class ViewController: UIViewController {
    
    let uuid = NSUUID().uuidString

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
    }

    @IBAction func clickButton(_ sender: Any) {
        
        let config = VLConfig(clientId: "subhadipmondal")
        config.setUserId(userId: uuid)
        config.setUserName(userName: "IOS "+uuid)
        config.setUserEmail(userEmail: uuid+"@icloud.com")
//        config.setUserPhone(userPhone: "+91-"+uuid)
        config.putCustomField(key: "userID", value: uuid, scope: .ROOM)
        config.setStaging(isStaging: false)
        let verloop = VerloopSDK(config: config)
        let chatController = verloop.getNavController()
        self.present(chatController, animated: true)
        
        config.setButtonOnClickListener(onButtonClicked:{ (title:Any, type:Any, payload:Any) in
            print("Inside ButtonClickListner Button -> ",title)
        })
        config.setUrlClickListener(onUrlClicked:{ (url:Any) in
            print("Inside URL ClickListners URL -> ",url)
       })
        
    }
    
}

