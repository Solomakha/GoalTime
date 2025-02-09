//
//  LeaguesViewController.swift
//  GoalTime
//
//  Created by Дмитрий Соломаха on 05.01.2025.
//

import UIKit

class LeaguesViewController: UIViewController, CollectionViewDelegate {
    
    let systemImages = ["CL", "LaLiga", "ligue-1",
                        "premier", "ser_a"]
    
    private let leaguesCollectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customColor = UIColor(named: "backgroundColor")
        view.backgroundColor = customColor
        
        view.addSubview(leaguesCollectionView)
        addConstraints()
        
        leaguesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        leaguesCollectionView.delegate = self
        leaguesCollectionView.reloadData()
        leaguesCollectionView.registerCell(LeaguesCollectionViewCell.self, withIdentifier: LeaguesCollectionViewCell.identifier)
        
        //        APIClient.shared.fetchLeagues { result in
        //            switch result {
        //            case .success(let leagues):
        //                print("✅ Список всех лиг:")
        //                leagues.forEach { print($0) } // 📌 Выводим каждую лигу в консоль
        //            case .failure(let error):
        //                print("❌ Ошибка: \(error.localizedDescription)")
        //            }
        //        }
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            leaguesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            leaguesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            leaguesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            leaguesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            leaguesCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            leaguesCollectionView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    func configureCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeaguesCollectionViewCell.identifier, for: indexPath) as! LeaguesCollectionViewCell
        cell.configure(with: UIImage(named: "\(systemImages[indexPath.row])"), title: "123")
        return cell
    }
    
    func numberOfItems() -> Int {
        return systemImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}
