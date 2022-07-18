//
//  MockPeopleUseCase.swift
//  RoomDirectoryTests
//
//  Created by Admin on 18/07/2022.
//

import Foundation
@testable import DirectoryApp
import XCTest

class MokcPeopleUseCase: PeopleUseCase {
    
    var peoplesRecords: [PeopleRecord]?
    
    func execute() async throws -> [PeopleRecord] {
        
        if peoplesRecords == nil {
            throw  APIError.invalidData
        }
       return  peoplesRecords!
    }
    
    func getImage(for url: String) async throws -> Data {
        if url == "invalid" {
            throw  APIError.invalidData
        }
        return url.data(using: .utf8)!
    }
    
    func enqueuePeopelesRecords(peoplesRecords: [PeopleRecord]) {
        self.peoplesRecords = peoplesRecords
    }
}

