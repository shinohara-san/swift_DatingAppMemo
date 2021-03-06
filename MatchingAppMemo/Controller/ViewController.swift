//
//  ViewController.swift
//  MatchingAppMemo
//
//  Created by Yuki Shinohara on 2020/07/22.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit
//import RealmSwift

class ViewController: UIViewController {
    
    var dataSource: PersonDataSource!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

        dataSource = PersonDataSource() ///この1行!!!!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource.getData(reload: tableView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dataSource.allPeople = [Person]()
    }

    @IBAction func barButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "add") as! AddViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource.data(at: indexPath.row)?.name
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSource.delete(at: indexPath.row, tableView: tableView)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        vc.person = dataSource.data(at: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
