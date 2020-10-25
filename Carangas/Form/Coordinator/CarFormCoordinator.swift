import UIKit

class CarFormCoordinator: Coordinator {
  
  var navigationController: UINavigationController
  var childCoordinator: [Coordinator] = []
  var parentCoordinator: Coordinator?
  let carFormViewModel: CarFormViewModel
  
  init(navigationController: UINavigationController, carFormViewModel: CarFormViewModel = CarFormViewModel()) {
    self.navigationController = navigationController
    self.carFormViewModel = carFormViewModel
  }
  
  func startModally() {
    let viewController = CarFormViewController.instantiateFromStoryboard(.Form)
    viewController.viewModel = carFormViewModel
    viewController.coordinator = self
    navigationController.present(viewController, animated: true, completion: nil)
  }
  
  func start() {
    let viewController = CarFormViewController.instantiateFromStoryboard(.Form)
    viewController.viewModel = carFormViewModel
    viewController.coordinator = self
    navigationController.pushViewController(viewController, animated: true)
  }
  
  func childDidFinish(_ child: Coordinator?) {
    parentCoordinator?.childDidFinish(self)
  }
  
  deinit {
    print("CarFormCoordinator -> deinit")
  }
}
