//
//  NotBilgisi.swift
//  Dusor
//
//  Created by HasanRiza on 5.06.2014.
//  Copyright (c) 2014 Burak Çavuşoğlu. All rights reserved.
//

import Foundation
import UIKit

class NotBilgisi: UIViewController {
    
    @IBOutlet var svNotlar : UITextView
    override func viewDidLoad() {
        super.viewDidLoad()
        var json = dataMgr.tasks[0].not
        var dersler:NSArray = json["dersler"] as NSArray
        var st = ""
        for ders_a in dersler
        {
            var ders:NSDictionary = ders_a as NSDictionary
            for item_a in ders
            {
                //var item = item_a as (String, String)
                var (n,s) = item_a
                var line:String = s as String
                st += line + "\n"
            }
        }
        svNotlar.text = st
    }

    
    
}

