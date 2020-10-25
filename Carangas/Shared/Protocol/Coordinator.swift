//
//  Coordinator.swift
//  Carangas
//
//  Created by helton.silveira on 25/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
  var navigationController: UINavigationController {get set}
  var childCoordinator: [Coordinator] {get set}
  var parentCoordinator: Coordinator? {get set}
  
  func start()
  func add(childCoordinator coordinator: Coordinator)
  func remove(childCoordinator coordinator: Coordinator)
  func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
  func add(childCoordinator coordinator: Coordinator){
    childCoordinator.append(coordinator)
  }
  
  func remove(childCoordinator coordinator: Coordinator){
    childCoordinator = childCoordinator.filter{ $0 !== coordinator }
  }
  
  func childDidFinish(_ child: Coordinator?) {
    guard let child = child else {return}
    remove(childCoordinator: child)
  }
}
