//
//  Menu.swift
//  dusor
//
//  Created by HasanRiza on 5.06.2014.
//  Copyright (c) 2014 Burak Çavuşoğlu. All rights reserved.
//

import Foundation
import UIKit

class Menu: UIViewController {
    
    @IBOutlet var btnot : UIButton
    @IBOutlet var btkgs : UIButton
    @IBOutlet var btdevam : UIButton
    @IBOutlet var bthesap : UIButton
    @IBOutlet var btayar : UIButton
    override func viewDidLoad() {
        super.viewDidLoad()
        btnot.addTarget(self, action: "NotBilgisi:", forControlEvents: UIControlEvents.TouchUpInside)
        btkgs.addTarget(self, action: "KGSBilgi:", forControlEvents: UIControlEvents.TouchUpInside)
        btdevam.addTarget(self, action: "DevamDurumu:", forControlEvents: UIControlEvents.TouchUpInside)
        bthesap.addTarget(self, action: "NotHesaplama:", forControlEvents: UIControlEvents.TouchUpInside)
        btayar.addTarget(self, action: "Ayarlar:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func NotBilgisi(sender : UIButton!)
    {
        
    }
    func KGSBilgi(sender : UIButton!)
    {
        
    }
    func DevamDurumu(sender : UIButton!)
    {
        
    }
    func NotHesaplama(sender : UIButton!)
    {
        
    }
    func Ayarlar(sender : UIButton!)
    {
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

