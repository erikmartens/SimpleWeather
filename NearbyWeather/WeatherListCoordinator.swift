//
//  WeatherListCoordinator.swift
//  NearbyWeather
//
//  Created by Erik Maximilian Martens on 04.02.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

enum WeatherListStep: StepProtocol {
  case initial
  case weatherDetails
  case none
}

class WeatherListCoordinator: Coordinator {
  
  // MARK: - Required Properties
  
  private static var root: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.navigationBar.backgroundColor = .white
    navigationController.navigationBar.barTintColor = .black
    navigationController.navigationBar.tintColor = .nearbyWeatherStandard
    return navigationController
  }()
  
  override var initialStep: StepProtocol {
    return WeatherListStep.initial
  }
  
  override var associatedStepperIdentifier: String {
    return WeatherListStep.identifier
  }
  
  // MARK: - Initialization
  
  init(parentCoordinator: Coordinator?) {
    super.init(
      rootViewController: Self.root,
      parentCoordinator: parentCoordinator,
      type: WeatherListStep.self
    )
  }
  
  // MARK: - Navigation
  
  @objc override func didReceiveStep(_ notification: Notification) {
    super.didReceiveStep(notification, type: WeatherListStep.self)
  }
  
  override func executeRoutingStep(_ step: StepProtocol, nextCoordinatorReceiver receiver: (NextCoordinator) -> Void) {
    guard let step = step as? WeatherListStep else { return }
    switch step {
    case .initial:
      summonWeatherListController(nextCoordinatorReceiver: receiver)
    case .weatherDetails:
    break // TODO
    case .none:
      break
    }
  }
}

private extension WeatherListCoordinator {
  
  func summonWeatherListController(nextCoordinatorReceiver: (NextCoordinator) -> Void) {
    let weatherListViewController = R.storyboard.weatherList.weatherListViewController()!
    weatherListViewController.title = R.string.localizable.tab_weatherList().uppercased()
    
    weatherListViewController.tabBarItem.selectedImage = R.image.tabbar_list_ios11()
    weatherListViewController.tabBarItem.image = R.image.tabbar_list_ios11()
    
    (rootViewController as? UINavigationController)?.setViewControllers([weatherListViewController], animated: false)
  }
  
}
