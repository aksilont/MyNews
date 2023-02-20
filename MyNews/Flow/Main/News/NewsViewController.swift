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
    
    private var dataNews: [News] = [] {
        didSet { tableView.reloadData() }
    }
    private var selectedNews: News?
    
    // MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNews()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailNewsViewController
        else { return }
        
        destination.currentNews = selectedNews
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        navigationItem.backButtonTitle = ""
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        
        guard let tabBar = tabBarController?.tabBar else { return }
        
        let appearance = tabBar.standardAppearance
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        tabBar.standardAppearance = appearance;
        
        let separator = BarSeparator()
        tabBar.addSubview(separator)
        NSLayoutConstraint.activate(separator.layoutConstraints(for: tabBar))
    }
    
    private func fetchNews() {
        dataNews = MockData.shared.mockNews
    }

}

// MARK: - UITableViewDataSource

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.delegate = self
        cell.configure(item: dataNews[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNews = dataNews[indexPath.row]
        performSegue(withIdentifier: "goDetailNews", sender: nil)
    }
    
}

// MARK: - UITableViewDelegate

extension NewsViewController: UITableViewDelegate {
}

// MARK: - NewsCellChangeDelegate

extension NewsViewController: NewsCellChangeDelegate {
    func changeCell(index: UUID) {
        guard let indexNews = MockData.shared.mockNews.firstIndex(where: { $0.id == index }) else { return }
        MockData.shared.mockNews[indexNews].liked.toggle()
        fetchNews()
    }
}
