//
//  ViewController.swift
//  Dusor
//
//  Created by Burak Çavuşoğlu on 05/06/14.
//  Copyright (c) 2014 Burak Çavuşoğlu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, NSURLConnectionDelegate {
    @IBOutlet var tvPw : UITextField
    @IBOutlet var tvNo : UITextField
    @IBOutlet var btGiriş : UIButton
    
    override func viewDidLoad(){
        super.viewDidLoad()
        btGiriş.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func buttonAction(sender: UIButton!){
        println(tvNo.text + ":" + tvPw.text)
        let urlPath: String = "http://107.170.167.72:8080/?usr=\(tvNo.text)&pw=\(tvPw.text)&json=true"
        var parsedJSON = parseJSON(getJSON(urlPath))
        var hata = parsedJSON["hata"] as String
        println(hata)
        if hata == "-"
        {
            dataMgr.addTask(parsedJSON)
            //let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
            //let vc : UIViewController = storyboard.instantiateViewControllerWithIdentifier("Menu") as UIViewController;
            //self.presentViewController(vc, animated: true, completion: nil)
        }
        else
        {
            //let alert = UIAlertController(title: "Hata", message: "Kulanıcı adı veya şifre hatalı.", preferredStyle: UIAlertControllerStyle.Alert)
            //alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.Default, handler: nil))
            //self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest))
    }
    
    func parseJSON(inputData: NSData) -> NSDictionary{
        var error: NSError?
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
        
        return boardsDictionary
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

