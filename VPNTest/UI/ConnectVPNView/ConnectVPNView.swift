//
//  ConnectVPNView.swift
//  VPNTest
//
//  Created by Mary on 20.02.21.
//

import UIKit

final class ConnectVPNView: UIViewController {
    private let presenter: ConnectVPNPresenterProtocol
    private var timer: Timer?
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ABOUT", style: .plain, target: self, action: #selector(openCountriesListView))
        presenter.attachView(self)
        setupElements()
    }
    
    init(presenter: ConnectVPNPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ConnectVPNView {
    @objc func openCountriesListView() {
        presenter.openCountriesList()
    }
    
    @IBAction func connectButtonPressed(_ sender: UIButton) {
        resultLabel.text = ""
        connectButton.isEnabled = false
        startTimer()
        sender.pulsate()
    }
    
    func setupElements() {
        connectButton.setTitle("CONNECT", for: .normal)
        connectButton.layer.cornerRadius = 20
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { [weak self] (_) in
            guard let self = self else { return }
            self.connectButton.isEnabled = true
            self.resultLabel.text = "SUCCESS CONNECTION"
            self.connectButton.removeAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.animate(withDuration: 1) { [weak self] in
                    guard let self = self else { return }
                    self.resultLabel.alpha = 0
                } completion: { (_) in
                    self.resultLabel.text = ""
                    self.resultLabel.alpha = 1
                }
            }
        })
    }
}

extension ConnectVPNView: ConnectVPNViewProtocol {
    func showCountry(country: CountryModel) {
        countryLabel.text = country.countryName
        flagImageView.image = UIImage(named: country.flagImageName)
    }
}

extension ConnectVPNView: CAAnimationDelegate {
}
