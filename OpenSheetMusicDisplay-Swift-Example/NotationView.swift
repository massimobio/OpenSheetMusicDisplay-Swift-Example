//
//  NotationView.swift
//  OpenSheetMusicDisplay-Swift-Example
//
//  Created by Massimo Biolcati on 11/29/20.
//

import UIKit
import WebKit

class NotationView: WKWebView, WKNavigationDelegate {
    
    private var zoom = 1.0
    private let scores = ["FaurReveSample", "The Beginning"]
    private var selectedScore = 0
    
    init(containerView: UIView) {
        super.init(frame: CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height), configuration: WKWebViewConfiguration())
        containerView.backgroundColor = .white
        isOpaque = false
        backgroundColor = .clear
        scrollView.backgroundColor = .clear
        navigationDelegate = self
        configuration.ignoresViewportScaleLimits = true
        backgroundColor = UIColor.clear
        allowsBackForwardNavigationGestures = false
        isUserInteractionEnabled = true
        
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "OSMD") {
            let request = URLRequest(url: url)
            load(request)
        }
        containerView.addSubview(self)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: WKNavigationDelegate functions
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Did finish navigation")
        let xmlURL = URL(fileURLWithPath: Bundle.main.path(forResource: scores[selectedScore], ofType: "musicxml")!)
        guard var xmlString = try? String(contentsOf: xmlURL) else {
            print("Couldn't read the MusicXML file")
            return
        }
        xmlString = xmlString.replacingOccurrences(of: "'", with: "\\'").replacingOccurrences(of: "\n", with: "")
        evaluateJavaScript("""
        console.log("Attempt loading of MusicXML file");
        var osmd = new opensheetmusicdisplay.OpenSheetMusicDisplay("osmdContainer");
        osmd.setOptions({
          backend: "svg", drawTitle: true, followCursor: true,
          // drawingParameters: "compacttight" // don't display title, composer etc., smaller margins
        });
        osmd.load('\(xmlString)').then(function () {
          osmd.render();
          osmd.cursor.show();
          osmd.rules.DefaultColorCursor = "#2FDAE0"; // light blue. use HTML hex colors
        });
        """) { reply, error in
                print("JavaScript Initial load evaluation completed")
                print(reply ?? "No reply")
                print(error ?? "No error")
        }
    }
    
    @objc func changeZoomLevelPlus() {
        zoom += 0.25
        if zoom > 2.1 {
            zoom = 2.0
        }
        
        evaluateJavaScript("osmd.zoom = \(zoom);osmd.render();") { reply, error in
            print("JavaScript updateZoomLevel evaluation completed")
            print(reply ?? "No reply")
            print(error ?? "No error")
        }
    }
    
    @objc func changeZoomLevelMinus() {
        zoom -= 0.25
        if zoom < 1.0 {
            zoom = 1.0
        }
        
        evaluateJavaScript("osmd.zoom = \(zoom);osmd.render();") { reply, error in
            print("JavaScript updateZoomLevel evaluation completed")
            print(reply ?? "No reply")
            print(error ?? "No error")
        }
    }
    
    @objc func cursorNext() {
        evaluateJavaScript("osmd.cursor.next();") { reply, error in
            print("JavaScript cursorNext evaluation completed")
            print(reply ?? "No reply")
            print(error ?? "No error")
        }
    }
    
    @objc func switchScore() {
        selectedScore += 1
        if selectedScore >= scores.count {
            selectedScore = 0
        }
        reload()
    }
    
}
