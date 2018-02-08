//
//  MovieCell.swift
//  Flix
//
//  Created by Hussain Almajed on 1/15/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    var movie: Movie!{
        
        didSet{
            titleLabel.text = movie.title as! String
            overviewLabel.text = movie.overview as! String
            if let posterUrl = movie.posterUrl {
                posterImageView.af_setImage(withURL: posterUrl)
            }
            if let backDropurl = movie.backDropURL {
                posterImageView.af_setImage(withURL: backDropurl)
            }
            
            
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

}
