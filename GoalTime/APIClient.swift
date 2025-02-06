//
//  APIClient.swift
//  GoalTime
//
//  Created by Дмитрий Соломаха on 06.02.2025.
//

import Foundation
import Alamofire

class APIClient {
    static let shared = APIClient()
    
    private let baseURL = "https://v3.football.api-sports.io"
    private let apiKey = "774c72e2d259a6211fd51e5dc217ac3b"
    
    func fetchLeagues(completion: @escaping (Result<[String], Error>) -> Void) {
        let url = "\(baseURL)/leagues"
        let headers: HTTPHeaders = [
            "x-rapidapi-key": apiKey,
            "x-rapidapi-host": "v3.football.api-sports.io"
        ]
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: ResponseModel.self) { response in
                switch response.result {
                case .success(let modelResponse):
                    // 📌 Получаем список лиг
                    let leagues = modelResponse.response.map { $0.league.name }
                    completion(.success(leagues.sorted()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
