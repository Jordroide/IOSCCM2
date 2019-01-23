//
//  DetailsViewController.swift
//  IOSCCM2
//
//  Created by Jordane SERREAU Dev on 23/01/2019.
//  Copyright © 2019 Jordane SERREAU Dev. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var labelDomains: UILabel!
    @IBOutlet weak var labelSuffix: UILabel!
    @IBOutlet weak var labelUpdateDate: UILabel!
    
    var myDomain: Domain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    /**
     * Asscociate datas to component s
     */
    func loadData() {
        labelDomains.text = myDomain?.domain
        print(myDomain?.domain)
        print(myDomain?.suffix)
        print(myDomain?.updateDate)
        labelSuffix.text = myDomain?.suffix
        labelUpdateDate.text = myDomain?.updateDate
    }
}
