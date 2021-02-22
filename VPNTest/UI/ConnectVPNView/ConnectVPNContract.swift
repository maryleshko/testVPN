//
//  ConnectVPNContract.swift
//  VPNTest
//
//  Created by Mary on 20.02.21.
//

import Foundation

protocol ConnectVPNPresenterProtocol: AnyObject {
    func attachView(_ view: ConnectVPNViewProtocol)
    func openCountriesList()
}

protocol ConnectVPNViewProtocol: AnyObject {
    func showCountry(country: CountryModel)
}

protocol ConnectVPNPresenterDelegate: AnyObject {
    func openCountriesList(presenter: ConnectVPNPresenter)
}

