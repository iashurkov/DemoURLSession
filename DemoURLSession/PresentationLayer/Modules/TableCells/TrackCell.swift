//
//  TrackCell.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

final class TrackCell: UITableViewCell {
    
    // MARK: Private properties
    
    private var model: TrackModel?
    private var isPlaying = false
    
    private enum Constants {
        static let sizeFontForTitle: CGFloat = 17
        
        static let separatorHeight: CGFloat = 1
        
        static let buttonSize: CGFloat = 24
        
        static let isPlaying = UIImage(systemName: "play.fill")
        static let isPause = UIImage(systemName: "pause.fill")
    }
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: Constants.sizeFontForTitle)
        label.numberOfLines = 2
        label.textColor = Colors.black
        
        return label
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: nil)
        
        self.drawSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.drawSelf()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = nil
    }
    
    // MARK: Drawing
    
    private func drawSelf() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear
        
        self.addSubview(self.separatorView)
        self.addSubview(self.titleLabel)
        
        let constraintsForSeparatorView = self.constraintsForSeparatorView()
        let constraintsForTitleLabel = self.constraintsForTitleLabel()
        
        NSLayoutConstraint.activate(
            constraintsForSeparatorView +
            constraintsForTitleLabel
        )
    }
    
    // MARK: Get NSLayoutConstraints
    
    private func constraintsForSeparatorView() -> [NSLayoutConstraint] {
        let topAnchor = self.separatorView.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingAnchor = self.separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingAnchor = self.separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let heightAnchor = self.separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight)
        
        return [
            topAnchor, leadingAnchor, trailingAnchor, heightAnchor
        ]
    }
    
    private func constraintsForTitleLabel() -> [NSLayoutConstraint] {
        let centerYAnchor = self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let leadingAnchor = self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingAnchor = self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        return [
            centerYAnchor, leadingAnchor, trailingAnchor
        ]
    }
    
    // MARK: Public methods
    
    func setup(with model: TrackModel) {
        self.model = model
        
        self.titleLabel.text = model.name ?? "Unknown"
    }
}
