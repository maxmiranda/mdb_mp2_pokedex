//
//  WelcomeViewController.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/9/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // UIComponents for Header
    var header_img: UIImageView!
    
    // UIComponents for SelectingFilters
    var filter_buttons: [FilterButton] = []
    var filter_collection: [FilterCellView] = []
    var filterCollectionView: UICollectionView!
    
    // UIComponents for Events
    var filteredSearch: UIButton!
    var randomizedSearch: UIButton!
    
    // UISpacing Components
    let PADDING:CGFloat = 20
    var WORKING_SPACE:CGFloat!
    
    // Search Logic Components
    var selected_filters: [SearchFilter] = []
    var qualifiedPokemon: [Pokemon] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WORKING_SPACE = view.frame.width - 2 * PADDING
        
        //Initialize UI Components
        init_img()
        init_grid()
        init_buttons()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    

}
