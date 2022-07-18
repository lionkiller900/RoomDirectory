//
//  CoordinatorType.swift
//  RoomDirectory
//
//  Created by Admin on 18/07/2022.
//

import Foundation
import UIKit

protocol CoordinatorType: AnyObject {
    var navController: UINavigationController { get set }
    func start()
}
