//
//  URLRequest+Extension.swift
//  RoomDirectory
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation

extension URLRequest {
    
    static func getURLRequest(for apiRequest:ApiRequestType)-> URLRequest? {
        if let url = URL(string:apiRequest.baseUrl.appending(apiRequest.path)),
           let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false){
            let urlRequest = URLRequest(url: urlComponents.url!)
            return urlRequest
        } else {
            return nil
        }
    }
}

