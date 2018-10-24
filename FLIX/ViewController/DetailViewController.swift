//
//  DetailViewController.swift
//  FLIX
//
//  Created by user143130 on 10/5/18.
//  Copyright © 2018 Antwaan ThomasMorgan. All rights reserved.
//

import UIKit
enum MovieKeys {
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var posterimage: UIImageView!
    
    @IBOutlet weak var backdropimage: UIImageView!
    
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var releasedatelabel: UILabel!
    
    @IBOutlet weak var overviewlabel: UILabel!
    
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            titlelabel.text = movie[MovieKeys.title] as? String
            releasedatelabel.text = movie["release date"] as? String
            overviewlabel.text = movie["Overview"] as? String
            let backdropPathString = movie[MovieKeys.backdropPath] as! String
            let posterPathString = movie[MovieKeys.posterPath] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            backdropimage.af_setImage(withURL: backdropURL)
            let posterpathURL = URL(string: baseURLString + posterPathString)!
            posterimage.af_setImage(withURL: posterpathURL)
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
