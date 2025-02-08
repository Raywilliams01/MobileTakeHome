//
//  youtubeView.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/4/25.
//

import SwiftUI
import WebKit

struct YoutubeView: UIViewRepresentable {
    
    let videoUrl: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: URL(string: videoUrl)!)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
