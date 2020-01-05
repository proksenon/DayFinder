//
//  ViewController.swift
//  DayFinder
//
//  Created by Вадим  Преснов on 04/01/2020.
//  Copyright © 2020 rwerg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBOutlet weak var out1: UITextField!
    @IBOutlet weak var out2: UITextField!
    @IBOutlet weak var out3: UITextField!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var rez: UILabel!
    @IBAction func find(_ sender: UIButton) {
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        guard let da = out1.text, let mo = out2.text, let ye = out3.text else { return }
        dateComponents.day = Int(da)
        dateComponents.month = Int(mo)
        dateComponents.year = Int(ye)
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let dateFormated = DateFormatter()
        dateFormated.locale = Locale(identifier: "ru_RU")
        dateFormated.dateFormat = "EEEE"
        
        let weekday = dateFormated.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        
        rez.text = capitalizedWeekday
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

