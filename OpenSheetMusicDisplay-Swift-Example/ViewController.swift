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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Zoom", style: .plain, target: notationView, action: #selector(NotationView.changeZoomLevel))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cursor", style: .plain, target: notationView, action: #selector(NotationView.cursorNext))
    }
    
}
