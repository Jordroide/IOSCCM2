//
//  DomainsTableViewController.swift
//  IOSCCM2
//
//  Created by Jordane SERREAU Dev on 22/01/2019.
//  Copyright © 2019 Jordane SERREAU Dev. All rights reserved.
//

import UIKit

class DomainsTableViewController: UITableViewController {
    
    var domains: [Domains]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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
