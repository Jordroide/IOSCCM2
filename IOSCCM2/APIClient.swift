//  APIClient.swift
//  IOSCCM2
//
//  Created by Jordane SERREAU Dev on 22/01/2019.
//  Copyright © 2019 Jordane SERREAU Dev. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    static func getResponseForDns(withCompletion completion: @escaping
        (Result<Data>) -> Void) {
        Alamofire.request("https://api.domainsdb.info/search?query=facebook")
            .responseData{(dataResponse) in print(dataResponse)
                completion(dataResponse.result)
        }
    }
}
