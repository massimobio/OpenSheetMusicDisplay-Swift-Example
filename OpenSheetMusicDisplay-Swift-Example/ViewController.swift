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
        
        let zoomAction = UIAction(handler: { [self] _ in
            notationView?.changeZoomLevel()
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Zoom", image: nil, primaryAction: zoomAction, menu: nil)
        
        let cursorNextAction = UIAction(handler: { [self] _ in
            notationView?.cursorNext()
        })
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Next", image: nil, primaryAction: cursorNextAction, menu: nil)

    }
    
}
