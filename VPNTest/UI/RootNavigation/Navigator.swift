//
//  Navigator.swift
//  VPNTest
//
//  Created by Mary on 20.02.21.
//

import UIKit

protocol NavigatorProtocol: AnyObject {
    func setupWindow()
}

final class Navigator {
    private let window: UIWindow
    private var splashWindow: UIWindow?
    private var stackNavigationVC = [UINavigationController]()
    private var topViewController: UIViewController?
    private let factory: Factory
    private let assembly: Assembly

    private var currentNavigation: UINavigationController? {
        get {
            return stackNavigationVC.last
        }
    }

    init(window: UIWindow, assembly: Assembly) {
        self.window = window
        self.assembly = assembly
        self.factory = Factory(self.assembly)
    }
}

// MARK: - Private
private extension Navigator {
    func pushToCurrent(viewController: UIViewController, animated: Bool) {
        currentNavigation?.pushViewController(viewController, animated: true)
    }
    
    func presentToCurrent(viewController: UIViewController, animated: Bool) {
        viewController.modalPresentationStyle = .overCurrentContext
        currentNavigation?.present(viewController, animated: animated)
    }
    
    func popToRoot() {
        currentNavigation?.popToRootViewController(animated: true)
    }
    
    func pop() {
        currentNavigation?.popViewController(animated: true)
    }
    
    func dismissCurrentNavigation(animated: Bool, complection: (() -> Void)?) {
        currentNavigation?.dismiss(animated: animated, completion: {
            if self.stackNavigationVC.count > 1 {
                _ = self.stackNavigationVC.popLast()
                if let complection = complection {
                    complection()
                }
            }
        })
    }
}

// MARK: - NavigatorProtocol
extension Navigator: NavigatorProtocol {
    func setupWindow() {
        let viewController = factory.connectVPNView(delegate: self)
        let nc = factory.navigation(with: viewController)
        stackNavigationVC.append(nc)
        window.rootViewController = nc
    }
}

extension Navigator: ConnectVPNPresenterDelegate {
    func openCountriesList(presenter: ConnectVPNPresenter) {
        let viewController = factory.countriesListView(delegate: self, connectVPNPresenter: presenter)
        pushToCurrent(viewController: viewController, animated: true)
    }
}

extension Navigator: CountriesListPresenterDelegate {
    func closeView() {
        pop()
    }
}
