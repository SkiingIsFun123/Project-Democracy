//
//  CandidateWebsiteScreen.swift
//  Democracy
//
//  Created by Liam Dowd on 9/4/22.
//

import UIKit
import WebKit

class CandidateWebsiteScreen: UIViewController, WKUIDelegate {
    
    @IBOutlet var candidateWebView: WKWebView!
    var candidate: BallotpediaElection.Candidate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Made it to candidate website screen")
        guard let candidate = candidate else {
            return
        }
        let myURL = URL(string: candidate.website)
        let myRequest = URLRequest(url: myURL!)
        candidateWebView.load(myRequest)
    }

}

