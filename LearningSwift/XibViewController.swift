//
//  XibViewController.swift
//  LearningSwift
//
//  Created by Thangam on 08/05/23.
//

import UIKit

class XibViewController: UIViewController {
    @IBOutlet weak var xibTableView: UITableView!
    @IBOutlet weak var imageCollection: UICollectionView!
    
    var images: [String] = ["image1","image2","image5","image3","image4","image2","image4","image3","image1","image5","image5","image4","image3","image2","image1"]
    var names: [String] = ["Image1","Image2","Image5","Image3","Image4","Image2","Image4","Image3","Image1","Image5","Image5","Image4","Image3","Image2","Image1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollection.delegate = self
        imageCollection.dataSource = self
        imageCollection.collectionViewLayout = UICollectionViewFlowLayout()
        xibTableView.delegate = self
        xibTableView.dataSource = self
        xibTableView.register(UINib(nibName: "XibTableCell", bundle: nil), forCellReuseIdentifier: "XibTableCell")
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
extension XibViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (xibTableView.dequeueReusableCell(withIdentifier: "XibTableCell") as? XibTableCell)!
        cell.tbImage.image = UIImage(named: String("image\(indexPath.row + 1)"))
        cell.tbLabel.text = "Image \(indexPath.row + 1)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected image\(indexPath.row + 1)")
    }
    
}

extension XibViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imageCollectionViewCell
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 20
        cell.labelCv.text = names[indexPath.row]
        cell.imageCv.image = UIImage(named: images[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10)/2
        return CGSize(width: size, height: size)
    }
    
}
