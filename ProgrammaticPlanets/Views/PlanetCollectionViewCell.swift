//
//  PlanetCollectionViewCell.swift
//  ProgrammaticPlanets
//
//  Created by Spencer Curtis on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    var planet: Planet! {
        didSet {
            updateViews()
        }
    }
    
// You have to add both init methods:
    
// ____________________________________________________________
    
    // 1.  Used to create cells programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    // 2.  Used by storyboard to initialize cells
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubViews()
    }
    
// ____________________________________________________________
    
    private func setUpSubViews() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        // Method 1 used to create the topAnchor constraint
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        
        // Method 2 to create the leading and width constraints
        let leadingConstraint = NSLayoutConstraint(item: imageView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 4)
        
        let trailingConstraint = NSLayoutConstraint(item: imageView,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .trailing,
                                                    multiplier: 1,
                                                    constant: -4)
        
        // Method 1 used to create the heightAnchor constraint
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint])
        
        self.imageView = imageView
        
        // add the label
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
        self.nameLabel = label
    }
    
    private func updateViews() {
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
}
