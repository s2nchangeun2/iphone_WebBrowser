//
//  ViewController.swift
//  Browser
//
//  Created by 신창은 on 2023/10/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {
    @IBOutlet var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var mainWebView: WKWebView!
    @IBOutlet var spinningActivityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func bookMarkAction(_ sender: UITextField) {
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "http://www.\(bookMarkUrl!).com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        if !urlString.hasPrefix("http://"){
            urlString = "http://\(urlTextField.text!)"
        }
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://www.google.com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinningActivityIndicatorView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinningActivityIndicatorView.stopAnimating()
    }
    
    
    @IBAction func goBackAction(_ sender: UIBarButtonItem) {
        if mainWebView.canGoBack{
            mainWebView.goBack()
        }
    }
    
    @IBAction func goForwardAction(_ sender: UIBarButtonItem) {
        if mainWebView.canGoForward{
            mainWebView.goForward()
        }
    }
    
    @IBAction func reloadAction(_ sender: UIBarButtonItem) {
        mainWebView.reload()
    }
    
    @IBAction func stopLoadingAction(_ sender: UIBarButtonItem) {
        mainWebView.stopLoading()
    }
}
