//
//  RoomsRepository.swift
//  RoomDirectory
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation

protocol RoomsRepository {
    func getRooms() async throws -> [RoomRecord]
}
