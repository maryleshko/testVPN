//
//  CountriesListView.swift
//  VPNTest
//
//  Created by Mary on 22.02.21.
//

import UIKit

final class CountriesListView: UIViewController {
    private let presenter: CountriesListPresenterProtocol
    @IBOutlet weak var countriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        setupElements()
    }

    init(presenter: CountriesListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CountriesListView {
    func setupElements() {
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        countriesTableView.indicatorStyle = .white
        let cellNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        countriesTableView.register(cellNib, forCellReuseIdentifier: CustomTableViewCell.identifier())
    }
}

extension CountriesListView: CountriesListViewProtocol {
}

extension CountriesListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = presenter.getCountryByIndex(indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier(), for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.title = country.countryName
        cell.imageName = country.flagImageName
        return cell
    }
}

extension CountriesListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.sendCountryByIndex(indexPath.row)
    }
}
