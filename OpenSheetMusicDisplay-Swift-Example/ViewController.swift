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
        
        let cursorMover = UIBarButtonItem(image: UIImage(systemName: "arrow.forward.square"), style: .plain, target: notationView, action: #selector(NotationView.cursorNext))
        let scoreSelector = UIBarButtonItem(image: UIImage(systemName: "doc"), style: .plain, target: notationView, action: #selector(NotationView.switchScore))
        navigationItem.leftBarButtonItems = [scoreSelector, cursorMover]

        let zoomIn = UIBarButtonItem(image: UIImage(systemName: "plus.magnifyingglass"), style: .plain, target: notationView, action: #selector(NotationView.changeZoomLevelPlus))
        let zoomOut = UIBarButtonItem(image: UIImage(systemName: "minus.magnifyingglass"), style: .plain, target: notationView, action: #selector(NotationView.changeZoomLevelMinus))
        navigationItem.rightBarButtonItems = [zoomIn, zoomOut]
        
    }
    
}
