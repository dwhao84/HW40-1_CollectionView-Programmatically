//
//  WebViewController.swift
//  HW40-1_CollectionView Programmatically
//
//  Created by Dawei Hao on 2023/12/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

//    var webView = WKWebView()
    var url: String?
    var activityIndicator = UIActivityIndicatorView()

    private let backButton: UIButton = {
        let backButton                    = UIButton(type: .system)
        var config                        = UIButton.Configuration.tinted()
        var title                         = AttributedString("Back")
        title.font                        = UIFont.systemFont(ofSize: 10)
        config.background.backgroundColor = .systemBlue
        config.attributedTitle            = title
        config.baseBackgroundColor        = .systemBlue
        backButton.configuration          = config
        return backButton
    }()

    private var webView = {
        // showing webpage styling
        let prefs = WKWebpagePreferences()
        // Enable to see the JS content.
        prefs.allowsContentJavaScript           = true
        let configuration                       = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webView                             = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView

        let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        activityIndicatorView.style            = .medium
        activityIndicatorView.color            = .gray
        activityIndicatorView.hidesWhenStopped = true

        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL     = URL(string: url!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.customUserAgent = ""   // The custom user agent string.

        DispatchQueue.main.asyncAfter(deadline: .now()+3) { self.webView.evaluateJavaScript("document.body.innerHTML") { result, error in
            guard let html = result as? String, error == nil else { return }
            // print out the html content
            print(html)
        }
            print("Into the WebViewController")
        }
    }

    func showActivityIndicator(show: Bool) {
            if show {
                // Start the loading animation
                activityIndicator.startAnimating()
            } else {
                // Stop the loading animation
                activityIndicator.stopAnimating()
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning")
    }
}

extension WebViewController: UIWebViewDelegate, WKNavigationDelegate, WKUIDelegate {

    // WKUIDelegate
    func webViewDidClose(_ webView: WKWebView) {
        webView.uiDelegate?.webViewDidClose!(webView)
        print("webViewDidClose")
    }

    // WKNavigationDelegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish to load")
        title = webView.title
        showActivityIndicator(show: false)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start to load")
        showActivityIndicator(show: true)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        showActivityIndicator(show: false)
    }



    func goBack() {

    }

    func goForward () {

    }
}


