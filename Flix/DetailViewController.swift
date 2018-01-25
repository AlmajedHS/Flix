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
    
    var movie : [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie{
            TitleLabel.text = movie["title"] as! String
            DateLabel.text = movie["release_date"] as! String
            overViewLabel.text = movie["overview"] as! String
            let backDroppathString = movie["backdrop_path"] as! String
            let posterPathString = movie["poster_path"] as! String
            let baseUrl = "https://image.tmdb.org/t/p/w500"
            
            let backDropURL = URL(string: baseUrl+backDroppathString)
            BackDropImageView.af_setImage(withURL: backDropURL!)
            let posterURL = URL(string: baseUrl+posterPathString)
            PosterImageView.af_setImage(withURL: posterURL!)
            
            
            
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
