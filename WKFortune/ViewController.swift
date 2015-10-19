//
//  ViewController.swift
//  WKFortune
//
//  Created by Stephen on 19/10/2015.
//  Copyright © 2015 lumiator.technology.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fortunes = ["Don't look behind you.",
    "You will have great wealth.",
    "I'm an iPhone, not a iGuru.",
    "The future looks good.",
    "Do you know what time it is?",
    "An alien will visit soon."]
    
    var history = Array<String>()

    @IBOutlet weak var lblFortune: UILabel!
    
    func generateFortune() -> String {
        let numFortunes = Int(fortunes.count)
        let index = Int(random() % numFortunes)
        lblFortune.text=fortunes[index]
        history.append(fortunes[index])
        
        return fortunes[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

