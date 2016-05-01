//
//  BLEManager.swift
//  BLEUnderstandingTest
//
//  Created by Steven Sanchez on 4/17/16.
//  Copyright © 2016 Apargo. All rights reserved.
//

import UIKit
import CoreBluetooth

/// This class does BLE Management
public class BLEManager: NSObject, CBCentralManagerDelegate {
    
        /// Testing that this works
    static let sharedManager: BLEManager = BLEManager()
    
    var centralManager: CBCentralManager?
    
    var observableUpdate: String?
    
    
    func startScanAndConnect() {
        self.centralManager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey : true])
    }
    
    /**
     Test For Jazzy
     
     - parameter central:           test
     - parameter peripheral:        test
     - parameter advertisementData: test
     - parameter RSSI:              test
     */
    public func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        
        let message = "Found Peripheral \(peripheral)"
        self.observableUpdate = message;
        print(message)
    }
    
    public func centralManager(central: CBCentralManager, didFailToConnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        let message = "Error connecting to peripheral \(peripheral) error: \(error)"
        self.observableUpdate = message
        print(message)
    }
    
    public func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        let message = "Disconnected \(peripheral) error: \(error)"
        self.observableUpdate = message
        print(message)
    }
    
    public func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        let message = "Connected \(peripheral)"
        self.observableUpdate = message
        print(message)
    }
    
    public func centralManager(central: CBCentralManager, willRestoreState dict: [String : AnyObject]) {
        let message = "centralManagerWillRestoreState \(dict)"
        self.observableUpdate = message
        print(message)
    }
    
    public func centralManagerDidUpdateState(central: CBCentralManager) {
        let message = "centralManagerDidUpdateState \(central)"
        self.observableUpdate = message
        print(message)
        
        self.centralManager?.scanForPeripheralsWithServices(nil, options: nil)
        self.observableUpdate = "Starting Scan"
    }
}
