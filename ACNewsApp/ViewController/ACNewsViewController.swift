//
//  LGNewsViewController.swift
//  ACNewsApp
//
//  Created by Ezgi Karahan on 8.05.2024.
//

import UIKit

class ACNewsViewController: UIViewController {
    
    var viewModel = ACNewsViewViewModel()
    public let newsView = ACNewsView() //view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNewsView()
        bindViewModel()
        viewModel.fetchNews()
    }
    
    private func setupNewsView() {
        
        view.addSubview(newsView)
        newsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            newsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        newsView.tableView.dataSource = self
        newsView.tableView.delegate = self
    }
    
    
    func bindViewModel() {
        viewModel.onNewsUpdated = {
            print("News was successfully fetched. Total articles: \(self.viewModel.articles.count)")
            // Burada UI güncellemeleri yapabilirsiniz, örneğin bir tableView güncellemesi
            DispatchQueue.main.async {
                self.newsView.tableView.reloadData() 
            }
        }
        
        viewModel.onErrorOccurred = { error in
            print("An error occurred: \(error)")
            // Hata durumunda kullanıcıya bilgi verebilirsiniz
        }
    }
}
    

extension ACNewsViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.articles.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ACNewsTableViewCell.cellIdentifier, for: indexPath) as? ACNewsTableViewCell else {
                fatalError("Could not dequeue ACNewsTableViewCell")
            }
            let article = viewModel.articles[indexPath.row]
            cell.titleLabel.text = article.title
            cell.loadImage(from: article.urlToImage)
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
