//
//  RoomsViewController.swift
//  RoomDirectory
//
//  Created by Admin on 18/07/2022.
//

import UIKit
import Combine

final class RoomsViewController: UIViewController, Alertable {
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!

    var viewModel:RoomsViewModel?
    
    private var bindings = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("rooms", comment:"")
        setupBinding()
        getRooms()
    }
}
