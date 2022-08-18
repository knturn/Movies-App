//
//  MovieHomeCell.swift
//  Movies App
//
//  Created by Kaan Turan on 18.08.2022.
//

import UIKit
import SnapKit
final class MovieHomeCell: UITableViewCell {
    
    //MARK: UIELEMENTS
    private let cellTitle : UILabel = {
        let label = UILabel() ; return label
    }()
    private let cellSubtitle : UILabel = {
        let label = UILabel() ; return label
    }()
    private let cellImage : UIImage = {
        let image = UIImage() ; return image
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
}
