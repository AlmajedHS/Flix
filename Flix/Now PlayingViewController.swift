//
//  Now PlayingViewController.swift
//  Flix
//
//  Created by Hussain Almajed on 1/14/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit
import AlamofireImage



class Now_PlayingViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var movies: [Movie] = []
    var refreshControl :UIRefreshControl!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(Now_PlayingViewController.didPullToRefresh(_refreshControl:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        tableView.dataSource = self
        fetchMovies()
        didPullToRefresh(_refreshControl: refreshControl)
        
        
        
    }
    @objc func didPullToRefresh(_refreshControl : UIRefreshControl){
        
        fetchMovies()
    }
    func fetchMovies(){
        self.activityIndicator.startAnimating()
        MovieApiManager().popularMovies{ (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
                
            }
            self.refreshControl.endRefreshing()

            self.activityIndicator.stopAnimating()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
//        let movie = movies[indexPath.row]
//        let title = movie["title"] as! String
//        let overview = movie["overview"] as! String
//
//        cell.titleLabel.text = title
//        cell.overviewLabel.text = overview
//
//        let PosterPathString = movie["poster_path"] as! String
//        let baseURL = "https://image.tmdb.org/t/p/w500"
//        let posterURL = URL(string: baseURL + PosterPathString)!
//        cell.posterImageView.af_setImage(withURL: posterURL)
        
         cell.movie  = movies[indexPath.row]
       
        
        return cell

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
             let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
       
    }



}
