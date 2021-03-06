//
//  MainSearchViewController.swift
//  TuneSearch
//
//  Created by Ben Ormos on 17/09/2018.
//  Copyright © 2018 com.benormos. All rights reserved.
//

import UIKit

fileprivate let showDetailSegue: String = "showDetailSegue"
fileprivate let resultCell: String = "resultCell"
fileprivate let tableCellHeight: CGFloat = 88.0

class MainSearchViewController: UIViewController {
    
    @IBOutlet weak var textSearchBar: UISearchBar! {
        didSet {
            textSearchBar.delegate = self
        }
    }
    @IBOutlet weak var searchCategorySegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var resultsTableView: UITableView! {
        didSet {
            resultsTableView.delegate = self
            resultsTableView.dataSource = self
        }
    }
    
    fileprivate let viewModel = ResultTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? ResultDetailViewController {
            detailVC.result = viewModel.getResult()
        }
    }
    
    @IBAction func searchCategoryChange(_ sender: UISegmentedControl) {
        viewModel.setSelectionState(sender.selectedSegmentIndex)
    }

}

extension MainSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        guard let text = searchBar.text else { return }
        viewModel.searchFor(text) { foundResults in
            if foundResults {
                doOnMain {
                    self.resultsTableView.reloadData()
                    self.resultsTableView.reloadInputViews()
                }
            }
        }
    }
}

extension MainSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfResults()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resultCell, for: indexPath) as! ResultTableViewCell
        
        let resultAtIndexPath = viewModel.resultForIndex(indexPath.row)
        cell.configure(resultAtIndexPath)
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectResult(indexPath.row)
        performSegue(withIdentifier: showDetailSegue, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableCellHeight
    }
}

