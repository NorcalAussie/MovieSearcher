//
//  MovieTableViewCell.swift
//  MovieSearcher
//
//  Created by Matthew Pearce on 3/19/20.
//  Copyright © 2020 Matthew Pearce. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var viewModel: MovieTableViewCellViewModel! {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        coverImageView.image = nil
        coverImageView.backgroundColor = .white
        titleLabel.text = viewModel.movieTitleText
        yearLabel.text = viewModel.releaseText
        viewModel.loadCover { (image) in
            DispatchQueue.main.async {
                if let image = image {
                    self.coverImageView.backgroundColor = .clear
                }
                self.coverImageView.image = image
            }
        }
    }

}
