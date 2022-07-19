//
//  PeopleResponce.swift
//  RoomDirectory
//
//  Created by Donald Daniels on 17/07/2022.
//

import Foundation

// MARK: - PeopleResponce
struct PeopleResponceDTO: Codable {
    
    var createdAt: String?
    var firstName: String?
    var avatar: String?
    var lastName: String?
    var email: String?
    var jobTitle: String?
    var favouriteColor: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey{
        case createdAt,firstName,avatar,email,lastName,favouriteColor,id
        case jobTitle = "jobtitle"
    }
}

// MARK: - Mappings to Domain

extension PeopleResponceDTO {
    func toDomain() -> PeopleRecord {
        return PeopleRecord(firstName: firstName ?? "", avatar: avatar ?? "", lastName: lastName ?? "", email: email ?? "", jobTitle: jobTitle ?? "", joinedDate: createdAt ?? "")
    }
}

