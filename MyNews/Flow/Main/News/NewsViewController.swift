//
//  NewsViewController.swift
//  MyNews
//
//  Created by Aksilont on 15.02.2023.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var dataNews: [News] = News.mockData()
    var currentNews: News?
    
    // MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "NewsCell")
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailNewsViewController
        else { return }
        
        destination.currentNews = currentNews
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        navigationItem.backButtonTitle = ""
        
        guard let tabBar = tabBarController?.tabBar else { return }
        
        let appearance = tabBar.standardAppearance
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        tabBar.standardAppearance = appearance;
        
        let separator = BarSeparator()
        tabBar.addSubview(separator)
        NSLayoutConstraint.activate(separator.layoutConstraints(for: tabBar))
    }

}

// MARK: - UITableViewDataSource

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.configure(news: dataNews[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentNews = dataNews[indexPath.row]
        performSegue(withIdentifier: "goDetailNews", sender: nil)
    }
    
}

// MARK: - UITableViewDelegate

extension NewsViewController: UITableViewDelegate {
}
