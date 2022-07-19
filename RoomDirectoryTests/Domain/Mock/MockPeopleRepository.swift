//
//  MockPeopleRepository.swift
//  RoomDirectoryTests
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation
@testable import RoomDirectory

final class MockPeopleRepository: PeoplesRepository {
    var peoplesRecords: [PeopleRecord]?

    func getPeoples() async throws -> [PeopleRecord] {
        if peoplesRecords == nil {
            throw  APIError.invalidData
        }
       return  peoplesRecords!
    }
    
    func getImages(for url: String) async throws -> Data {
        if url == "invalid" {
            throw  APIError.invalidData
        }
        return url.data(using: .utf8)!
    }
    
    func enqueuePeopelesRecords(peoplesRecords: [PeopleRecord]) {
        self.peoplesRecords = peoplesRecords
    }
}

