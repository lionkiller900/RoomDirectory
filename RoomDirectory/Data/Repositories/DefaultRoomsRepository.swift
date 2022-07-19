//
//  DefaultRoomsRepository.swift
//  RoomDirectory
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation


final class DefaultRoomsRepository {
        
    private let networkManager: Networkable
    
    init(networkManager:Networkable) {
        self.networkManager = networkManager
    }
    
    private func getDecodedResopnse(from data: Data)-> [RoomsResponceDTO]? {
        guard let roomsResponceDTO = try? JSONDecoder().decode([RoomsResponceDTO].self, from: data) else {
            return nil
        }
        return roomsResponceDTO
    }
}

extension DefaultRoomsRepository: RoomsRepository {
    func getRooms() async throws -> [RoomRecord] {
        let  apiRequest = ApiRequest(baseUrl: EndPoint.baseUrl, path:Path.rooms.rawValue, params: [:])
        
        guard let data = try? await  self.networkManager.get(apiRequest: apiRequest) else {
            throw APIError.invalidData
        }
        
        guard let roomsResponseDTO = getDecodedResopnse(from: data) else {
            throw APIError.jsonParsingFailed
        }
        
        let roomsRecords = roomsResponseDTO.map { $0.toDomain()}
        
        if roomsRecords.isEmpty {
            throw APIError.emptyRecords
        }
            
        return roomsRecords
    }
}

