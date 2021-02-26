//
//  ViewController.swift
//  MyPokedexProject
//
//  Created by pongpon on 2/2/2564 BE.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//       callingAPIbyMoya()
        callingAPIbyApple()
    }
    private func callingAPIbyApple() {
        callingGetAPI()

    }
    private func callingGetAPI() {
        let urlStr = "https://run.mocky.io/v3/f9916417-f92e-478e-bfbc-c39e43f7c75b"
        guard let url = URL(string: urlStr) else { return }
        let manager = AppleAPIManager()
        manager.getData(url: url) { (response) in
            if let res =  response as? [String: Any] {
                print((res["cards"] as? [Any] ?? [])[0])
            } else {
                print(response ?? "get service errors")
            }
        }
    }


}

