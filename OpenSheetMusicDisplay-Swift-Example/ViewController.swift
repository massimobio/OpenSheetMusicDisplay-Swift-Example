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
        
        let action = UIAction(handler: { [self] _ in notationView?.reload() })
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .redo, primaryAction: action, menu: nil)
    }
    
    


}

