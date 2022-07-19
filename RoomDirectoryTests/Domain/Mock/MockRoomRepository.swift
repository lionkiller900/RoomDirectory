//
//  MockRoomRepository.swift
//  RoomDirectoryTests
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation
@testable import RoomDirectory

final class MockRoomRepository: RoomsRepository {
    
    var roomsRecords: [RoomRecord]?

    func getRooms() async throws -> [RoomRecord] {
        if roomsRecords == nil {
           throw  APIError.invalidData
       }
      return  roomsRecords!
    }
    
    func enqueueRoomsRecords(roomsRecords: [RoomRecord]) {
        self.roomsRecords = roomsRecords
    }
}

