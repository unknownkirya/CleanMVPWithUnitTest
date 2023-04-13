//
//  DetailViewController.swift
//  MVPLevelOne
//
//  Created by Кирилл Бережной on 09.04.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.titleLabel?.text = "Pop"
        presenter.setComment()
    }

    @IBAction func tapAction(_ sender: Any) {
        presenter.tap()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
