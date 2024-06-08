//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 07/02/24.
//

import UIKit

public class MenuCell: UITableViewCell {
    public static let identifier: String = String(describing: MenuCell.self)
    public static let nib: UINib = UINib(nibName: identifier, bundle: Bundle.moduleBundle)
    
    @IBOutlet weak var leftIcon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var rightIcon: UIImageView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        title.font = .label2DemiBold
        subTitle.font = .label3Regular
    }
}
