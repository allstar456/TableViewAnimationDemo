//
//  ViewController.swift
//  TableViewAnimationDemo
//
//  Created by 陈志勇 on 2019/1/25.
//  Copyright © 2019 makepower. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var animation: Animation?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func fadeInBtnAction(_ sender: UIButton) {
        animation = AnimationFactory.makeFade(duration: 0.5, delayFactor: 0.05)
        tableView.reloadData()
    }

    @IBAction func damplingBtnAction() {
        animation = AnimationFactory.makeDamping()
        tableView.reloadData()
    }

    @IBAction func leftBtnAction() {
        animation = AnimationFactory.makeLeft()
        tableView.reloadData()
    }

    @IBAction func fadeAndDampingBtnAction() {
        animation = AnimationFactory.makeDampingAndFade()
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        cell.textLabel?.text = "title\(indexPath.row)"
        cell.backgroundColor = UIColor(hue: CGFloat(indexPath.row) / 30, saturation: 0.68,
                                       brightness: 0.98, alpha: 1)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let ani = animation else {
            return
        }
        let animator = Animator(animation: ani)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }

}
