//
//  Factory.swift
//  VPNTest
//
//  Created by Mary on 20.02.21.
//

import UIKit

final class Factory {
    private let assembly: Assembly
    
    init(_ assembly: Assembly) {
        self.assembly = assembly
    }
}

extension Factory {
    func navigation(with vc: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }
    
    func connectVPNView(delegate: ConnectVPNPresenterDelegate) -> UIViewController {
        let presenter = ConnectVPNPresenter(delegate: delegate)
        let view = ConnectVPNView(presenter: presenter)
        return view
    }
    
    func countriesListView(delegate: CountriesListPresenterDelegate, connectVPNPresenter: ConnectVPNPresenter) -> UIViewController {
        let presenter = CountriesListPresenter(delegate: delegate)
        presenter.countryDelegate = connectVPNPresenter
        let view = CountriesListView(presenter: presenter)
        return view
    }
}
