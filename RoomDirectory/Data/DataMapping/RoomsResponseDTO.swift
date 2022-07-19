//
//  RoomsResponseDTO.swift
//  RoomDirectory
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation

struct RoomsResponceDTO: Decodable {
    var createdAt: String
    var isOccupied: Bool
    var maxOccupancy: Int
    var id: String
}

// MARK: - Mappings to Domain

extension RoomsResponceDTO {
    func toDomain() -> RoomRecord {
        return RoomRecord(createdAt:createdAt, occupiedMessage: isOccupied ? "Occupied" :"Not Occupied", maxOccupancy: maxOccupancy, id: id)
    }
}
