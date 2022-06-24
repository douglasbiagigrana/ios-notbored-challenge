//
//  BoredNetworking.swift
//  notbored
//
//  Created by Douglas Biagi Grana on 23/06/22.
//

import Foundation
import Alamofire

final class BoredNetworking {
    func fetchRandomData(completion: @escaping (ActivityModel) -> Void) {
        let url = "http://www.boredapi.com/api/activity/"
        AF.request(url)
            .responseDecodable(of: ActivityModel.self) { data in
                switch data.result {
                case.success(let activity):
                    completion(activity)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func fetchDataByActivity(title: String, completion: @escaping (ActivityModel) -> Void) {
        let url = "http://www.boredapi.com/api/activity?type=\(title)"
        AF.request(url)
            .responseDecodable(of: ActivityModel.self) { data in
                switch data.result {
                case.success(let activity):
                    completion(activity)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
