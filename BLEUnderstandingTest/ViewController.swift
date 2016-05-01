//
//  ViewController.swift
//  BLEUnderstandingTest
//
//  Created by Steven Sanchez on 4/17/16.
//  Copyright © 2016 Apargo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beginScanButton: UIButton!
    
    @IBOutlet weak var reportLabel: UILabel!
    
    var centralManager: BLEManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = NSKeyValueObservingOptions([.New, .Old])
        
        self.centralManager = BLEManager.sharedManager
        self.centralManager?.addObserver(self, forKeyPath: "observableUpdate", options: options, context: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func beginScan(sender: AnyObject) {
        
        BLEManager.sharedManager.startScanAndConnect()
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        self.reportLabel.text = object as? String
    }
    
    deinit {
        self.centralManager!.removeObserver(self, forKeyPath: "observableUpdate")
    }
}

