//
//  TempViewController.swift
//  RightMatch
//
//  Created by Daniel Palacio on 9/29/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class TempViewController: UIViewController {
    private let recycler: RecyclerView = {
        let recycler = RecyclerView(frame: .zero)
        recycler.translatesAutoresizingMaskIntoConstraints = false
        return recycler
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(recycler)
        setUpRecycler()
        // Do any additional setup after loading the view.
    }
    private func setUpRecycler(){
        recycler.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recycler.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        recycler.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        recycler.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}
