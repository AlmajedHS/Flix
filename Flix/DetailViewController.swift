//
//  DetailViewController.swift
//  Flix
//
//  Created by Hussain Almajed on 1/18/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var BackDropImageView: UIImageView!
    @IBOutlet weak var PosterImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    var movie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie{
            
            TitleLabel.text = movie.title
            DateLabel.text = movie.date
            overViewLabel.text = movie.overview
            PosterImageView.af_setImage(withURL: movie.posterUrl!)
            BackDropImageView.af_setImage(withURL: movie.backDropURL!)
            
            
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
