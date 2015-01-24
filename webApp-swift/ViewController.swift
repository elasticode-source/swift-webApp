//
//  ViewController.swift
//  webApp-swift
//
//  Created by Tomer on 24/1/15.
//  Copyright (c) 2015 elasticode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var splashAnimation: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter .defaultCenter().addObserver(self, selector: "finishedSync", name: "ElastiEodeInSync", object: nil)
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        splashAnimation.hidden = true
        
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        splashAnimation.hidden = true
    }
    
    func finishedSync() {
        ElastiCode .defineDynamicObject("webURL", type: ElastiCodeDObjType_string, defaultValue: "http://www.elasticode.com")

        let fullURL = ElastiCode .valueForDynamicObject("webURL") as String;
        let url = NSURL(string: fullURL)
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
    }
}

