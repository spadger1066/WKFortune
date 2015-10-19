//
//  InterfaceController.swift
//  WKFortuneWatch Extension
//
//  Created by Stephen on 19/10/2015.
//  Copyright © 2015 lumiator.technology.com. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var lblFortune: WKInterfaceLabel!
    
    @IBAction func fortune() {
        if WCSession.defaultSession().reachable == true {
            let session = WCSession.defaultSession()
            session.sendMessage(["function": 1], replyHandler: { reply in
                let fortune = reply["fortune"] as! String
                self.lblFortune.setText(fortune)},
                errorHandler: { error in
                    print("error: \(error)")
            })
        }
    }

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
