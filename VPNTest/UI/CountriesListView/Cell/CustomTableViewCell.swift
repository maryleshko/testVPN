//
//  CustomTableViewCell.swift
//  VPNTest
//
//  Created by Mary on 22.02.21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    public var title: String? {
        didSet {
            guard let title = title else { return }
            countryLabel.text = title
        }
    }
    
    public var imageName: String? {
        didSet {
            guard let imageName = imageName else { return }
            flagImageView.image = UIImage(named: imageName)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    override func prepareForReuse() {
        reset()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        flagImageView.layer.cornerRadius = flagImageView.frame.height / 2
        flagImageView.contentMode = .scaleToFill
    }
}

private extension CustomTableViewCell {
    func reset() {
    }
}
