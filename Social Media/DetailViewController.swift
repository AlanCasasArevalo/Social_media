//
//  DetailViewController.swift
//  Listing images with FileManager Listing images with FileManager Listing images with FileManager
//
//  Created by Alan Casas on 2/9/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedImage: String?

    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Picture"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))


        if let imageToLoad = selectedImage {
            detailImageView.image  = UIImage(named: imageToLoad)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // This method shared the image with other people by facebook, email whatsup etc
    @objc func shareTapped() {
        let viewController = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(viewController, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
