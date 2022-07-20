//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Waylon Kumpe on 7/14/22.
//

import UIKit

class MemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var tableAddButton: UIBarButtonItem!

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let memes = (UIApplication.shared.delegate as! AppDelegate).memes
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meme = (UIApplication.shared.delegate as! AppDelegate).memes[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell")!
        let memedImage = meme.memedImage
        cell.imageView?.image = memedImage
        cell.textLabel?.text = "\(meme.topText ?? "") \(meme.bottomText ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        let meme = (UIApplication.shared.delegate as! AppDelegate).memes[(indexPath as NSIndexPath).row]
        let memedImage = meme.memedImage
        detailController.memedImage = memedImage
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
