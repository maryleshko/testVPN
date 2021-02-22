//
//  ConnectVPNPresenter.swift
//  VPNTest
//
//  Created by Mary on 20.02.21.
//

import Foundation

final class ConnectVPNPresenter {
    private weak var view: ConnectVPNViewProtocol?
    private weak var delegate: ConnectVPNPresenterDelegate?
    
    init(delegate: ConnectVPNPresenterDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Private
private extension ConnectVPNPresenter {
}

// MARK: - ConnectVPNPresenterProtocol
extension ConnectVPNPresenter: ConnectVPNPresenterProtocol {
    func openCountriesList() {
        delegate?.openCountriesList(presenter: self)
    }
    
    func attachView(_ view: ConnectVPNViewProtocol) {
        self.view = view
    }
}

extension ConnectVPNPresenter: CountriesListPresenterCountryDelegate {
    func sendCountry(country: CountryModel) {
        view?.showCountry(country: country)
    }
}

