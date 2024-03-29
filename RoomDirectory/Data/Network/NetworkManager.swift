//
//  NetworkManager.swift
//  RoomDirectory
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation

protocol Networkable {
    func get(apiRequest:ApiRequestType) async throws -> Data
}

class NetworkManager: Networkable {
    
    func get(apiRequest: ApiRequestType) async throws -> Data {
        guard let request = URLRequest.getURLRequest(for: apiRequest) else {
            throw APIError.requestFailed
        }
        do {
            let (data, _)  = try await URLSession.shared.data(for: request)
            return data
        }catch {
            throw APIError.invalidData
        }
    }
  
}

