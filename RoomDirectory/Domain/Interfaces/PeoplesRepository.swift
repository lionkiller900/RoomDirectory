//
//  PeoplesRepository.swift
//  RoomDirectory
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation

protocol PeoplesRepository {
   func getPeoples() async throws -> [PeopleRecord]
    func getImages(for url: String) async throws -> Data
}

protocol ImageCacher {
    func getImage(url:String)-> Data?
    func saveImage(url:String, data:Data)
}

