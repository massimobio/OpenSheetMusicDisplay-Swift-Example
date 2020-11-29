//
//  NotationView.swift
//  OpenSheetMusicDisplay-Swift-Example
//
//  Created by Massimo Biolcati on 11/29/20.
//

import UIKit
import WebKit

class NotationView: WKWebView, WKNavigationDelegate {
    
    init(containerView: UIView) {
        super.init(frame: CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height), configuration: WKWebViewConfiguration())
        containerView.backgroundColor = .clear
        isOpaque = false
        backgroundColor = .clear
        scrollView.backgroundColor = .clear
        navigationDelegate = self
        configuration.ignoresViewportScaleLimits = true
        backgroundColor = UIColor.clear
        allowsBackForwardNavigationGestures = false
        isUserInteractionEnabled = false
        
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
        let xmlURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Unlullaby", ofType: "musicxml")!)
        guard var xmlString = try? String(contentsOf: xmlURL) else {
            print("Couldn't read the MusicXML file")
            return
        }
        xmlString = xmlString.replacingOccurrences(of: "'", with: "\\'").replacingOccurrences(of: "\n", with: "")
        evaluateJavaScript("""
          console.log("Attempt loading of MusicXML file");
          var openSheetMusicDisplay = new opensheetmusicdisplay.OpenSheetMusicDisplay("osmdContainer");
          openSheetMusicDisplay.setOptions({
            backend: "svg",
            drawTitle: true,
            // drawingParameters: "compacttight" // don't display title, composer etc., smaller margins
          });
          openSheetMusicDisplay
            .load('\(xmlString)')
            .then(
              function() {
                openSheetMusicDisplay.render();
                openSheetMusicDisplay.zoom = 1.5;
              }
            );

        """) { (reply, error) in
            print("JavaScript evaluation completed")
            print(reply ?? "No reply")
            print(error ?? "No error")
        }
    }

}
