//
//  ViewController.swift
//  CollectionViewScroll
//
//  Created by Sudheesh on 3/28/17.
//  Copyright © 2017 DevelopScripts. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet var collectioView: UICollectionView!
    
    var imageNames = ["image1","image2","image3","image4","image5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.imageName.text = imageNames[indexPath.row]
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])
        cell.backgroundColor = UIColor.brownColor()
        return cell
        
    }
    
    func scrollToNextCell(){
        //get cell size
        let cellSize = CGSizeMake(self.view.frame.width, self.view.frame.height)

        //get current content Offset of the Collection view
        let contentOffset = collectioView.contentOffset
 
        if collectioView.contentSize.width <= collectioView.contentOffset.x + cellSize.width{
            collectioView.scrollRectToVisible(CGRectMake(0, contentOffset.y, cellSize.width, cellSize.height), animated: true)
        }
        else {
            collectioView.scrollRectToVisible(CGRectMake(contentOffset.x + cellSize.width, contentOffset.y, cellSize.width, cellSize.height), animated: true)
        }
    }
    
    /**
     Invokes Timer to start Automatic Animation with repeat enabled
     */
    func startTimer() {
        _ = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.scrollToNextCell), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageName: UILabel!

}
