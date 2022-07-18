//
//  PeopleViewStates.swift
//  RoomDirectory
//
//  Created by Admin on 18/07/2022.
//

import Foundation

enum PeopleViewStates: Equatable {
    case showActivityIndicator
    case showPeopleView
    case showError(String)
    case none
}
