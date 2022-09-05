//
//  CandidateTwitterScreen.swift
//  Democracy
//
//  Created by Liam Dowd on 9/4/22.
//

import UIKit
import WebKit

class CandidateTwitterScreen: UIViewController, WKUIDelegate {
    
    @IBOutlet var twitterWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Made it to candidate twitter screen")
        let myURL = URL(string:"https://www.twitter.com")
        let myRequest = URLRequest(url: myURL!)
        twitterWebView.load(myRequest)
    }
    
    override func loadView() {
       let webConfiguration = WKWebViewConfiguration()
        twitterWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        twitterWebView.uiDelegate = self
       view = twitterWebView
    }

}

