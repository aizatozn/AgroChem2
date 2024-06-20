//
//  TitlePreviewViewController.swift
//  AgroChem
//
//  Created by Abdulmajit Kubatbekov on 17/6/24.
//

import UIKit
import WebKit

final class TitlePreviewViewController: UIViewController {
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is the best movie ever to watch as a kid!"
        return label
    }()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.contentMode = .scaleToFill
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(titleLable)
        view.addSubview(overviewLabel)
        configureConstraints()
    }
    
    func configureConstraints() {

        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 330)
        ]
        
        let titleLableConstraints = [
            titleLable.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        let overViewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor )
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLableConstraints)
        NSLayoutConstraint.activate(overViewLabelConstraints)
    }
    
    func configure(with model: String, title: String, desc: String) {
        titleLable.text = title
        overviewLabel.text = desc
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(model)") else { return }
        webView.load(URLRequest(url: youtubeURL))
    }
}

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
}

struct Medicine_Youtube: Codable {
    let youtubeID: String
    let title: String
    let image: String
    var description: String
    
    internal init(youtubeID: String, title: String, image: String, description: String) {
        self.youtubeID = youtubeID
        self.title = title
        self.image = image
        self.description = description
    }
}
