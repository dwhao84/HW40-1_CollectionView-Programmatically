//
//  WebViewController.swift
//  HW40-1_CollectionView Programmatically
//
//  Created by Dawei Hao on 2023/12/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var webView: WKWebView!
    var url: String?

    private let backButton: UIButton = {
        let backButton = UIButton(type: .system)
        var config = UIButton.Configuration.tinted()
        var title = AttributedString("Back")
        title.font = UIFont.systemFont(ofSize: 10)
        config.background.backgroundColor = .systemBlue
        config.attributedTitle = title
        config.baseBackgroundColor = .systemBlue
        backButton.configuration = config
        return backButton
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)

        let myURL = URL(string: url!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        print("Into the WebViewController")
    }


    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
}

extension WebViewController: UIWebViewDelegate, WKNavigationDelegate, WKUIDelegate {

    // WKUIDelegate
    func webViewDidClose(_ webView: WKWebView) {
        webView.uiDelegate?.webViewDidClose!(webView)
        print("webViewDidClose")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isHidden = !webView.canGoBack
    }

    // WKNavigationDelegate
    func goBack() {

    }

    func goForward () {

    }
}


