//
//  AppCoordinator.swift
//  Carangas
//
//  Created by helton.silveira on 25/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
  var navigationController: UINavigationController
  
  var childCoordinator: [Coordinator] = []
  
  var parentCoordinator: Coordinator?
  
  init() {
    navigationController = UINavigationController()
    navigationController.navigationBar.prefersLargeTitles =  true
  }
  
  func start() {
    let childCoordinator = CarsListingCoordinator(navigationController: navigationController)
    childCoordinator.parentCoordinator = self
    add(childCoordinator: childCoordinator)
    childCoordinator.start()
  }
  
  
}
