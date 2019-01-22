//
//  ViewController.swift
//  IOSCCM2
//
//  Created by Jordane SERREAU Dev on 22/01/2019.
//  Copyright © 2019 Jordane SERREAU Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mEditText: UITextField!

    @IBOutlet weak var mButton: UIButton!
    
    @IBOutlet weak var mTableView: UITableView!
    
    var domains: [Domains]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mButton.addTarget(self, action: #selector(onButtonClick),for: .touchUpInside)
    }
    
    @objc func onButtonClick(sender: UIButton){
        convertWithPain()
    }
    
    func convertWithPain() {
        APIClient.getResponseForDns {[weak self] (result) in
            print("wesh")
            switch result {
            case .success(let value):
                do {
                    print("Do")
                    let decoder = JSONDecoder();
                    let domains = try decoder.decode([Domains].self, from: value)
                    print("decoder")
                    self?.domains = domains
                    print(domains)
                } catch (let error) {
                    print("Err")
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
