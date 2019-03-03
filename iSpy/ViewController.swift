//
//  ViewController.swift
//  iSpy
//
//  Created by Balmes Pavlov on 2/6/19.
//  Copyright © 2019 Balmes Pavlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.delegate = self
        updateZoomFor(size: view.frame.size)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Zoom far enough out to see the entire image.
        scrollView.setZoomScale(scrollView.minimumZoomScale, animated: false)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let top:  CGFloat = max((scrollView.frame.height - scrollView.contentSize.height) / 2, 0);
        let left: CGFloat = max((scrollView.frame.width  - scrollView.contentSize.width)  / 2, 0);
        scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: 0, right: 0);
    }
}

