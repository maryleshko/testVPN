//
//  CountriesListPresenter.swift
//  VPNTest
//
//  Created by Mary on 22.02.21.
//

import Foundation

protocol CountriesListPresenterCountryDelegate: AnyObject {
    func sendCountry(country: CountryModel)
}

final class CountriesListPresenter {
    private weak var view: CountriesListViewProtocol?
    private weak var delegate: CountriesListPresenterDelegate?
    weak var countryDelegate: CountriesListPresenterCountryDelegate?
    private let countries: [CountryModel]
    
    init(delegate: CountriesListPresenterDelegate) {
        self.delegate = delegate
        self.countries = [CountryModel(countryName: "USA", flagImageName: "3"), CountryModel(countryName: "Germany", flagImageName: "2"), CountryModel(countryName: "Norway", flagImageName: "1")]
    }
}

// MARK: - Private
private extension CountriesListPresenter {
}

// MARK: - CountriesListPresenterProtocol
extension CountriesListPresenter: CountriesListPresenterProtocol {
    func sendCountryByIndex(_ index: Int) {
        countryDelegate?.sendCountry(country: countries[index])
        delegate?.closeView()
    }
    
    func getCountryByIndex(_ index: Int) -> CountryModel {
        return countries[index]
    }
    
    func attachView(_ view: CountriesListViewProtocol) {
        self.view = view
    }
}
