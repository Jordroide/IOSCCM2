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
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelIsDead: UILabel!
    @IBOutlet weak var switchIsDead: UISwitch!

    @IBOutlet weak var switchResolvable: UISwitch!
    
    var myDomain: Domain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details for my domains"
        
        loadData()
    }
    
    /**
     * Asscociate datas to component
     */
    func loadData() {
        labelDomains.text = myDomain?.domain
        labelSuffix.text = "Suffix : " + (myDomain?.suffix ?? "undefined")
        labelUpdateDate.text = "Update date : " + (myDomain?.updateDate ?? "undefined")
        labelCountry.text = "Country : " + (myDomain?.country ?? "undefined")
        
        var isDead: Bool?
        var isResolvable: Bool?
        
        isDead = (myDomain?.isDead)
        isResolvable = (myDomain?.resolvable)
        
        if((isDead)!) {
            switchIsDead.setOn(true, animated: true)
        } else {
            switchIsDead.setOn(false, animated: true)
        }
        
        if((isResolvable)!) {
            switchResolvable.setOn(true, animated: true)
        } else {
            switchResolvable.setOn(false, animated: true)
        }
    }
}
