//
//  NetworkService.swift
//  sportify
//
//  Created by Eslam gamal on 23/05/2023.
//

import Foundation
import Alamofire

class NetworkService:NetworkServiceProtocol {
   
    static let getInstance = NetworkService()
   private init() {
        print("singleton object created")
    }
    func getSportAllLeaguesData(leagueName:String,completion: @escaping ([League]?) -> Void) {
        let url = "https://apiv2.allsportsapi.com/"+leagueName+"/?met=Leagues&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc"
        AF.request(url).responseDecodable(of:ApiResponse.self){response in
            switch response.result {
                 case .success(let value):
                print("success")
                 let data = value.result
                 completion(data)
                 case .failure(let error):
                     print(error)
                completion(nil)
        
                 }
        }
    }
    
}
