//
//  ViewController.swift
//  Kharlamov_practice
//
//  Created by practice on 24.09.2019.
//  Copyright © 2019 Kharlamov. All rights reserved.
//

import UIKit

class Films {
    var year: String = ""
    var titleRus: String = ""
    var titleEng: String = ""
    
    // конструктор
    init(yearString: String, titleRusString: String, titleEngString: String) {
        year = yearString
        titleRus = titleRusString
        titleEng = titleEngString
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Локальные данные для проверки
    var FilmsFeed = [
        Films(yearString: "1991", titleRusString: "Фильм 1", titleEngString: "Film 1"),
        Films(yearString: "1992", titleRusString: "Фильм 2", titleEngString: "Film 2"),
        Films(yearString: "1993", titleRusString: "Фильм 3", titleEngString: "Film 3"),
        Films(yearString: "1994", titleRusString: "Фильм 4", titleEngString: "Film 4"),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Откуда берем данные (переменные)
    // Возвращаем количество элементов в массиве
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FilmsFeed.count
    }
    
    // Обработка нажатий на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(FilmsFeed[indexPath.row].titleRus)
    }
    
    // Отрисовка ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "films", for: indexPath) as? FilmsCell
        
        cell?.titleRus.text = FilmsFeed[indexPath.row].titleRus
        cell?.titleEng.text = FilmsFeed[indexPath.row].titleEng
        return cell!
    }

}

// Пользовательские элементы описания
class FilmsCell: UITableViewCell {
    @IBOutlet weak var titleRus: UILabel!
    @IBOutlet weak var titleEng: UILabel!
}

class YearCell: UITableViewCell {
    @IBOutlet weak var year: UILabel!
}

