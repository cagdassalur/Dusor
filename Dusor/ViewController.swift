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
        var rawJSON = getJSON(urlPath)
        
        if (rawJSON == nil){
            alert("Server'a erişilemiyor", message: "İnternet Bağlantınızı kontrol edip daha sonra tekrar deneyin.", button: "Tamam")
            return
        }
        
        var parsedJSON = parseJSON(rawJSON)
        var hata = parsedJSON["hata"] as String
        
        println(hata)
        
        if hata == "-"
        {
            dataMgr.reset()
            saveJSON(parsedJSON)
            
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
            let vc : UIViewController = storyboard.instantiateViewControllerWithIdentifier("menu") as UIViewController;
            self.presentViewController(vc, animated: true, completion: nil);
        }
        else
        {
            alert("Hata", message: "Kullanıcı adı veya şifre hatalı.", button: "Tamam")
            return
        }
    }
    
    func alert(title: String, message: String, button: String){
        //let alert = UIAlertController(title: "Hata", message: "Kulanıcı adı veya şifre hatalı.", preferredStyle: UIAlertControllerStyle.Alert)
        //alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.Default, handler: nil))
        //self.presentViewController(alert, animated: true, completion: nil)
        var alertView = UIAlertView();
        alertView.addButtonWithTitle(button);
        alertView.title = title;
        alertView.message = message;
        alertView.show();
    }
    
    func saveJSON(json: NSDictionary){
        
        var dersler:NSArray = json["dersler"] as NSArray
        for ders_a:AnyObject in dersler
        {
            var ders:NSDictionary = ders_a as NSDictionary
            var tp = String[]()
            for (i, item_a) in enumerate(ders)
            {
                var (n:AnyObject, s:AnyObject) = item_a
                var line:String = s as String
                tp.append(line)
            }
            dataMgr.dersEkle(tp[4], dKod: tp[2], not: tp[10],
                kredi: tp[5], AKTS: tp[7], hoca: tp[8], basari: tp[12],
                büt: tp[0], grup: tp[3], yıl: tp[9], aDönem: tp[11], dönem: tp[1])
            
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

