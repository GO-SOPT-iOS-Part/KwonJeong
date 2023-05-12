//
//  ContentService.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/12.
//

import Foundation
import Alamofire

final class ContentService {
    
    static let shared = ContentService()
    
    private init() {}
    
    let url = "https://api.themoviedb.org/3/movie/popular?api_key=5ef8d1b433c1a9970f7ade5c76cc090d&language=ko-KR"
    
    func content(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: nil,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200..<300: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500..<600: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ContentResponse.self, from: data) else { return .pathErr }
        return .success(decodedData as Any)
    }
}
