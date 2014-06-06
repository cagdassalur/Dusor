//
//  DataManager.swift
//  Dusor
//
//  Created by Çağdaş Salur on 06/06/14.
//  Copyright (c) 2014 Burak Çavuşoğlu. All rights reserved.
//

import Foundation
import UIKit

var dataMgr: DataManager = DataManager()

struct task{
    var not: NSDictionary = NSDictionary()
}

class DataManager: NSObject {
    var tasks = task[]()
    
    func addTask(notlar: NSDictionary){
        tasks = task[]()
        tasks.append(task(not: notlar))
    }
}




