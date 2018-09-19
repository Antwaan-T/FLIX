//
//  MovieCell.swift
//  FLIX
//
//  Created by user143130 on 9/16/18.
//  Copyright © 2018 Antwaan ThomasMorgan. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var movieposter: UIImageView!
    @IBOutlet weak var overview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
