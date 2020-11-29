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
        
        let action = UIAction(handler: { [self] _ in
            guard let notation = notationView else { return }
            notation.zoom += 0.5
            if notationView.zoom > 2.1 {
                notation.zoom = 1.0
            }
            notation.updateZoomLevel()
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Zoom", image: nil, primaryAction: action, menu: nil)
    }
    
}
