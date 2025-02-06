//
//  LeaguesViewController.swift
//  GoalTime
//
//  Created by Дмитрий Соломаха on 05.01.2025.
//

import UIKit

class LeaguesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let customColor = UIColor(named: "backgroundColor")
        view.backgroundColor = customColor
        
        APIClient.shared.fetchLeagues { result in
            switch result {
            case .success(let leagues):
                print("✅ Список всех лиг:")
                leagues.forEach { print($0) } // 📌 Выводим каждую лигу в консоль
            case .failure(let error):
                print("❌ Ошибка: \(error.localizedDescription)")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
