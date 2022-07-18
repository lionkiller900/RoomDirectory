//
//  RoomsRepository.swift
//  RoomDirectory
//
//  Created by Admin on 18/07/2022.
//

import Foundation

protocol RoomsRepository {
    func getRooms() async throws -> [RoomRecord]
}

