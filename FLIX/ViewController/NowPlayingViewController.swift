//
//  NowPlayingViewController.swift
//  FLIX
//
//  Created by user143130 on 9/12/18.
//  Copyright © 2018 Antwaan ThomasMorgan. All rights reserved.
// 

import UIKit
import Alamofire
import AlamofireImage
 
class NowPlayingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    
    var movies: [[String: Any]] = []
    var refreshcontrol: UIRefreshControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        refreshcontrol = UIRefreshControl()
        
        refreshcontrol.addTarget(self, action: #selector
        (NowPlayingViewController.pullrefersh(_:)), for: .valueChanged)
       
        TableView.insertSubview(refreshcontrol, at: 0)
        
        TableView.dataSource = self; fetchmovies()
 
    }
    
    @objc func pullrefersh (_ refreshcontrol: UIRefreshControl)
    {
      fetchmovies()
    }
    
    func fetchmovies ()
    {
       
        TableView.rowHeight = 200
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request)
        { (data, response, error) in
            // This will run when the network request returns
            if let error = error
            {
                print(error.localizedDescription)
            } else if let data = data
            {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.TableView.reloadData()
                self.refreshcontrol.endRefreshing()
                
            }
        }
        task.resume()
        
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int)-> Int{return movies.count}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
       
        
        let movie = movies[indexPath.row]
        let title  = movie["title"] as! String
        let overview = movie["overview"] as! String
        cell.titlelabel.text=title
        cell.overview.text=overview
        
        let posterPathString = movie["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        
        let posterURL = URL(string: baseURLString + posterPathString)!
        cell.movieposter.af_setImage(withURL: posterURL)
        
        
        
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = TableView.indexPath(for: cell)
        {
        let movie = movies[indexPath.row]
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.movie = movie
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        // Dispose of any resources that can be recreated.
    }
    

   
}