//
//  MainMenuViewController.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/12/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel = MainMenuViewModel()
    
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 50.0, right: 10.0)

    @IBOutlet weak var gotoBasketBtn: UIBarButtonItem!
    @IBOutlet weak var btnOK: UIButton!
    
    @IBAction func okButton(_ sender: UIButton) {
        print(viewModel.mainMenuItemList.itemList.count)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        btnOK.layer.cornerRadius = 20
        createBadgeCounter()
        
        let cellnib = UINib(nibName: "MainMenuCollectionViewCell", bundle: nil)
        collectionView.register(cellnib, forCellWithReuseIdentifier: "MainMenuCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Choose items"
        
        if(UIDevice.current.userInterfaceIdiom == .pad){
            self.addLeftBarButtonWithImage(#imageLiteral(resourceName: "hamburger"))
            // change font
        }
        else {
            self.addLeftBarButtonWithImage(#imageLiteral(resourceName: "hamburger"))
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        }
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: setup collection view
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mainMenuItemList.itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainMenuCollectionViewCell", for: indexPath) as! MainMenuCollectionViewCell
        let name = viewModel.mainMenuItemList.itemList[indexPath.row].name
        let image = viewModel.mainMenuItemList.itemList[indexPath.row].img
        cell.setupItemCell(name: name, image: image)
        return cell
    }
    
    // MARK: dimensions
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerITem = availableWidth / itemsPerRow
        return CGSize(width: widthPerITem, height: widthPerITem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    // MARK: private functions
    func createBadgeCounter() {
        // create label with number
        // create button with background image and add label as subview
        // set navigationrightbaritem to this button
        let gotoBasketImage = UIImage(named: "empty_basket")?.withRenderingMode(.alwaysOriginal)
        let size = gotoBasketImage?.size.height
        
        let label = UILabel(frame: CGRect(x: 15, y: (size! - 15), width: 20, height: 20))
        label.layer.borderColor = UIColor.clear.cgColor
        label.layer.borderWidth = 2
        label.layer.cornerRadius = label.bounds.size.height / 2
        label.layer.masksToBounds = true
        
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFontWeightBold)
        label.backgroundColor = UIColor.red
        label.text = "80"
        
        let basketButton = UIButton(frame: CGRect(x: 0, y: 0, width: (gotoBasketImage?.size.height)!, height: (gotoBasketImage?.size.height)!))
        basketButton.setBackgroundImage(#imageLiteral(resourceName: "empty_basket"), for: .normal)
        basketButton.addTarget(self, action: #selector(self.basketIconPressed), for: .touchUpInside)
        basketButton.addSubview(label)
        
        let rightBarButtonItem = UIBarButtonItem(customView: basketButton)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func basketIconPressed() {
        print("Basket pressed")
    }
    

    /*
    // MARK: - Navigation
s
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
