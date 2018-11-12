//
//  DetailViewController.swift
//  InternetArchiveSDKExample
//
//  Created by Jason Buckner on 11/10/18.
//  Copyright © 2018 Jason Buckner. All rights reserved.
//

import UIKit
import InternetArchiveSDK

class ArtistDetailViewController: UIViewController {

  @IBOutlet weak var detailDescriptionLabel: UILabel!
  private weak var albumsViewController: AlbumsViewController?

  func configureView() {
    // Update the user interface for the detail item.
    if let detail = detailItem {
      if let label = detailDescriptionLabel {
        label.text = detail.title ?? "No title"
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    configureView()
  }

  var detailItem: InternetArchive.ItemMetadata? {
    didSet {
      // Update the view.
      configureView()
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "albums", let destination = segue.destination as? AlbumsViewController {
      destination.artist = self.detailItem
      self.albumsViewController = destination
    }
  }
}
