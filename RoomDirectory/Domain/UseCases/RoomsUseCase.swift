//
//  RoomsUseCase.swift
//  RoomDirectory
//
//  Created by Admin on 18/07/2022.
//

import Foundation

protocol RoomsUseCase {
    func execute() async throws -> [RoomRecord]
}

final class DefaultRoomsUseCase {
    private var roomsRepository: RoomsRepository

    init(roomsRepository: RoomsRepository) {
        self.roomsRepository = roomsRepository
    }
}

extension DefaultRoomsUseCase: RoomsUseCase {
    func execute() async throws -> [RoomRecord] {
        do {
            return try await roomsRepository.getRooms()
        }catch {
          throw error
        }
    }
}

