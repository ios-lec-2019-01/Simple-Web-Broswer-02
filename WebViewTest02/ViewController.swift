//
//  ViewController.swift
//  WebViewTest02
//
//  Created by 김종현 on 09/09/2019.
//  Copyright © 2019 김종현. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, WKNavigationDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading theview.
        
        // UISearchBarDelegate 객체와 UIViewController 객체와 연결
        searchBar.delegate = self
        webView.navigationDelegate = self
        
        indicator.isHidden = true
        
        let request = URLRequest(url: URL(string: "http://www.google.com")!)
        webView.load(request)
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
    
    @IBAction func forwardAction(_ sender: Any) {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }
    
    // SearchBarDelegate Method 호출
    // called when keyboard search button pressed
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let inputURL = searchBar.text!
        let request = URLRequest(url: URL(string: inputURL)!)
        webView.load(request)
    }
    
    // WKWebViewDelegate Method 호출
    // 웹 받기 시작할때
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    // 웹 받는 것 끝났을때
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        backButton.isEnabled = webView.canGoBack
        forwardButton.isSpringLoaded = webView.canGoForward
        indicator.isHidden = true
        indicator.stopAnimating()
    }
}

