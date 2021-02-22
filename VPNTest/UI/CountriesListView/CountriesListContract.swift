//
//  CountriesListContract.swift
//  VPNTest
//
//  Created by Mary on 22.02.21.
//

import Foundation

protocol CountriesListPresenterProtocol: AnyObject {
    func attachView(_ view: CountriesListViewProtocol)
    func getCountryByIndex(_ index: Int) -> CountryModel
    func sendCountryByIndex(_ index: Int)
}

protocol CountriesListViewProtocol: AnyObject {
}

protocol CountriesListPresenterDelegate: AnyObject {
    func closeView()
}
