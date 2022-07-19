//
//  MockNetworkManager.swift
//  RoomDirectoryTests
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation
@testable import RoomDirectory

class MockNetworkManager: Networkable {
    
    private var jsonFilePath = ""
    
    func get(apiRequest: ApiRequestType) async throws -> Data {
        
        if jsonFilePath == "imageDataValid" {
           return Data()
        }else if(jsonFilePath == "imageDataInValid") {
            throw APIError.invalidData
        }
        
        let bundle = Bundle(for:MockNetworkManager.self)
        
        guard let url = bundle.url(forResource: jsonFilePath, withExtension:"json"),
              let data = try? Data(contentsOf: url) else {
            throw APIError.invalidData
        }
        return data
    }
    
    func enqueue(jsonFilePath: String) {
        self.jsonFilePath = jsonFilePath
    }
}

