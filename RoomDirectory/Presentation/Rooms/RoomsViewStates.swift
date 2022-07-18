//
//  RoomsViewStates.swift
//  RoomDirectory
//
//  Created by Admin on 18/07/2022.
//

import Foundation

enum RoomsViewStates: Equatable {
    case showActivityIndicator
    case showRoomsView
    case showError(String)
    case none
}

