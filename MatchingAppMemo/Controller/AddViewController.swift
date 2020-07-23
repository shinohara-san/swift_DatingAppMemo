//
//  AddViewController.swift
//  MatchingAppMemo
//
//  Created by Yuki Shinohara on 2020/07/22.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//  ScrollView https://www.youtube.com/watch?v=KmE50giVuLA

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var dataSource: PersonDataSource!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var matchDayField: UITextField!
    @IBOutlet weak var impressionField: UITextView!
    @IBOutlet weak var goodTopicField: UITextView!
    @IBOutlet weak var badTopicField: UITextView!
    @IBOutlet weak var dateTodoField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        matchDayField.delegate = self
        impressionField.delegate = self
        goodTopicField.delegate = self
        badTopicField.delegate = self
        dateTodoField.delegate = self
        
        dataSource = PersonDataSource() ///この1行!!!!
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let newMatch = Person()
        guard let name = nameField.text else {return}
        guard let matchDay = matchDayField.text else {return}
        let impression = impressionField.text
        let goodTopic = goodTopicField.text
        let badTopic = badTopicField.text
        let todoOnDate = dateTodoField.text
        
        newMatch.id = UUID().uuidString
        newMatch.name = name
        newMatch.matchDay = matchDay
        newMatch.impression = impression ?? ""
        newMatch.goodTopic = goodTopic ?? ""
        newMatch.badTopic = badTopic ?? ""
        newMatch.todoOnDate = todoOnDate ?? ""
        
        dataSource.saveData(of: newMatch)
    }



}
