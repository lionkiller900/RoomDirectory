//
//  MockRoomsUseCase.swift
//  RoomDirectoryTests
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation
import XCTest
@testable import RoomDirectory


class MockRoomsUseCase: RoomsUseCase {
    var roomsRecords: [RoomRecord]?
    
   func execute() async throws -> [RoomRecord] {
        if roomsRecords == nil {
           throw  APIError.invalidData
       }
      return  roomsRecords!
    }
    
    func enqueueRoomsRecords(roomsRecords: [RoomRecord]) {
        self.roomsRecords = roomsRecords
    }
}


