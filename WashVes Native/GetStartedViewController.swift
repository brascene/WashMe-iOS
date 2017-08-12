//
//  GetStartedViewController.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/6/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func nextAction(_ sender: UIButton) {
        let messageVC = UIStoryboard(name: "MessageScreen", bundle: nil).instantiateViewController(withIdentifier: "MessageScreen") as! MessageScreenViewController
        messageVC.msgImage = #imageLiteral(resourceName: "loginSuccess")
        messageVC.msgTitle = "Hvala!"
        messageVC.msgSubtitle = "Obavijestit ćemo Vas kada veš bude suh i spreman za ormar."
        messageVC.btnText = "OK"
        messageVC.destinationSB = "MainMenu"
        messageVC.destinationVC = "MainMenu"
        let nav = UIStoryboard(name: "MessageScreen", bundle: nil).instantiateInitialViewController() as! WashNavigationViewController
        nav.setViewControllers([messageVC], animated: true)
        self.present(nav, animated: true)
    }
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var chooseCity: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = GetStartedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
        setupLabelGesture()
        setupCityLabel()
        automaticallyAdjustsScrollViewInsets = false        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        cell.setup(city: viewModel.cities[indexPath.row])
        
        if indexPath.row == 0 {
            cell.setLabelRadius(rectMask: [.topRight, .topLeft])
        } else if indexPath.row == (viewModel.cities.count - 1) {
            cell.setLabelRadius(rectMask: [.bottomLeft, .bottomRight])
        } else {
            cell.setLabelRadius(rectMask: [])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.choosenCity = viewModel.cities[indexPath.row]
        chooseCity.text = viewModel.choosenCity
        tableView.isHidden = true
        tableView.deselectRow(at: indexPath, animated: true)
        nextButton.isHidden = false
    }
    
    // MARK: - Other functions
    
    func setupTable () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let cell = UINib(nibName: "CityTableViewCell", bundle: nil)
        
        tableView.register(cell, forCellReuseIdentifier: "CityTableViewCell")
        tableView.isHidden = true
        
        nextButton.isHidden = true
        nextButton.layer.cornerRadius = 20
    }
    
    func openTable () {
        if tableView.isHidden {
            tableView.isHidden = false
            tableView.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.0)
            
            let tableHeight = tableView.contentSize.height
            
            tableView.transform = CGAffineTransform.init(translationX: 0, y: -tableHeight/2)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.tableView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
                self.tableView.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }, completion: nil)
        } else {
            tableView.isHidden = true
        }
    }
    
    func setupLabelGesture () {
        let gpr = UITapGestureRecognizer(target: self, action: #selector(self.openTable))
        gpr.numberOfTapsRequired = 1
        chooseCity.isUserInteractionEnabled = true
        chooseCity.addGestureRecognizer(gpr)
    }
    
    func setupCityLabel () {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.chooseCity.frame
        rectShape.position = self.chooseCity.center
        rectShape.path = UIBezierPath(roundedRect: self.chooseCity.bounds, byRoundingCorners: [.bottomLeft, .bottomRight, .topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        self.chooseCity.layer.mask = rectShape
    }
}
