//
//  DetailViewController.swift
//  MatchingAppMemo
//
//  Created by Yuki Shinohara on 2020/07/22.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("名前：\(person.name)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

}
