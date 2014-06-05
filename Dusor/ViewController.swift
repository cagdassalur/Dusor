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

    @lazy var data = NSMutableData()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        btGiriş.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func startConnection(){
        //let urlPath: String = "http://binaenaleyh.net/dusor/?usr=\(tvNo.text)&pw=\(tvPw.text)&json=true"
        let urlPath: String = "http://binaenaleyh.net/dusor/" // back-end bitene kadar geçici
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
        // TODO: butonu disable et
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func buttonAction(sender: UIButton!){
        println(tvNo.text + ":" + tvPw.text)
        startConnection()
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        println("Connection finished loading.")
        var err: NSError
        //println(data)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println(jsonResult)
        /*if jsonResult.count>0 && jsonResult["results"].count>0 {
            var results: NSArray = jsonResult["results"] as NSArray
            self.tableData = results
            self.appsTableView.reloadData()
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

