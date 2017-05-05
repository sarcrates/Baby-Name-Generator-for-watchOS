//
//  InterfaceController.swift
//  BabyNameGenerator WatchKit Extension
//
//  Created by Hana on 9/26/16.
//  Copyright © 2016 sarcrates. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var NameLabel: WKInterfaceLabel!
    @IBOutlet var anothername: WKInterfaceButton!
    @IBOutlet var girlorboy: WKInterfaceButton!
    var copyGirlNames: NSArray = NSArray()
    var copyBoyNames: NSArray = NSArray()
    
    
    var isGirl : Int = 1
    var randomBoy : Int = 0
    var randomGirl : Int = 0
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        var copiedGirlNames: GirlNames = GirlNames()
        var copiedBoyNames: BoyNames = BoyNames()
        copyGirlNames = copiedGirlNames.girlnames
        copyBoyNames = copiedBoyNames.boynames
        
        chooseGirlOrBoy()
        
        // Configure  objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func AnotherNameAction() {
        
        chooseName()
    }
    
    @IBAction func GirlBoyButtonAction() {
        chooseGirlOrBoy()
    }
    
    func chooseGirlOrBoy(){
        
        if isGirl == 0 {
            girlorboy.setTitle("Girl")
        }
        
        if isGirl == 1{
            girlorboy.setTitle("Boy")
            
        }
        
        isGirl = isGirl + 1
        
        if isGirl == 2{
            isGirl = 0
            
        }
        
        chooseName()
    }
    
    func chooseName(){
        
        if isGirl == 0{
            randomGirl = Int(arc4random_uniform(UInt32(copyGirlNames.count)))
            NameLabel.setText("\(copyGirlNames[randomGirl])")
        }
        
        if isGirl == 1{
            randomBoy = Int(arc4random_uniform(UInt32(copyBoyNames.count)))
            NameLabel.setText("\(copyBoyNames[randomBoy])")
            
        }
        
}
}
