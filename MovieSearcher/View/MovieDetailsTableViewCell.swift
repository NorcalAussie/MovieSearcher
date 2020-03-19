//
//  MovieDetailsTableViewCell.swift
//  MovieSearcher
//
//  Created by Matthew Pearce on 3/19/20.
//  Copyright © 2020 Matthew Pearce. All rights reserved.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
