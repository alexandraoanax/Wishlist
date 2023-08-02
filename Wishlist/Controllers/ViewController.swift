//
//  ViewController.swift
//  Wishlist
//
//  Created by Alexandra Oana on 02.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton(_ sender: UIButton) {
    }
    
    let data: [Item] = [
        Item(title: "VEEP", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", imageName: "Veep", rating: "7.8"),
        Item(title: "Stranger Things", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", imageName: "ST", rating: "8")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Wishlist"
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wishlistItem = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! WishlistCell
        cell.titleLabel.text = wishlistItem.title
        cell.bodyLabel.text = wishlistItem.body
        cell.posterImageView.image = UIImage(named: wishlistItem.imageName)
        cell.starImage.image = UIImage(named: "Star")
        cell.starLabel.text = wishlistItem.rating
        cell.rightLabel.text = "Watch on Netflix"
        return cell
    }
}
