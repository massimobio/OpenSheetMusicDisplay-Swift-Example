//
//  ViewController.swift
//  OpenSheetMusicDisplay-Swift-Example
//
//  Created by Massimo Biolcati on 11/29/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var containerView: UIView!
    private var notationView: NotationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notationView = NotationView(containerView: containerView)
        let zoomIn = UIBarButtonItem(image: UIImage(systemName: "plus.magnifyingglass"), style: .plain, target: notationView, action: #selector(NotationView.changeZoomLevelPlus))
        let zoomOut = UIBarButtonItem(image: UIImage(systemName: "minus.magnifyingglass"), style: .plain, target: notationView, action: #selector(NotationView.changeZoomLevelMinus))
        navigationItem.rightBarButtonItems = [zoomIn, zoomOut]
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cursor", style: .plain, target: notationView, action: #selector(NotationView.cursorNext))
    }
    
}
