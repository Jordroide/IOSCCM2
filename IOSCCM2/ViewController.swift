//
//  ViewController.swift
//  IOSCCM2
//
//  Created by Jordane SERREAU Dev on 22/01/2019.
//  Copyright © 2019 Jordane SERREAU Dev. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    @IBOutlet weak var mEditText: UITextField!
    
    @IBOutlet weak var mButton: UIButton!
    
    @IBOutlet weak var mTableView: UITableView!
    
    var statusCode: Int?
    var myData: MyData!
    var domains: [Domain] = []
    
    var isSucess: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.delegate = self
        mTableView.dataSource = self
        
        mButton.addTarget(self, action: #selector(onButtonClick),for: .touchUpInside)
    }
    
    @objc func onButtonClick(sender: UIButton){
        convertWithPain()
    }
    
    func convertWithPain() {
        APIClient.getResponseForDns(domainToSearch: mEditText.text!){[weak self] (result) in
        self?.statusCode = result.response?.statusCode
        switch result.result {
            case .success(let value):
                do {
                    print("Request successed")
                    let decoder = JSONDecoder();
                    let myData = try decoder.decode(MyData.self, from: value)
    
                    self?.myData = myData
                    self?.domains = myData.domains!
                    self?.isSucess = true
                    
                } catch (let error) {
                    print("Error from result inside request")
                    print(error.localizedDescription)
                    self?.isSucess = false
                }
                
            case .failure(let error):
                print("Request failed")
                print(error.localizedDescription)
            }
            self?.manageLogic()
        }
    }
    
    func manageLogic() {
        if self.isSucess {
            self.mTableView.isHidden = false
            self.mTableView.reloadData()
        }
        else {
            self.mTableView.isHidden = true
            switch self.statusCode {
            case 404:
                 self.sendEmail()
            default:
                  self.mEditText.text = "Undefined"
            }
        }
    }
    
    /**
     * This methods send email with the domains searched
     */
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject("Your domains is available")
            mail.setToRecipients(["alexis.paris21@orange.fr"])
            mail.setMessageBody("The domains : " +  mEditText.text! +  " is free !" , isHTML: true)
            
            present(mail, animated: true)
        
        } else {
           print("Fail to send email")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

extension ViewController: MFMailComposeViewControllerDelegate{}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return domains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.fill(withData: domains[indexPath.row])
        return cell
    }
}
