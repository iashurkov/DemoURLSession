//
//  DetailInformationViewController.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit
import AVFAudio

protocol DetailInformationViewInput: AnyObject {
    func didObtainView(with model: TrackModel)
}

final class DetailInformationViewController: UIViewController {
    
    // MARK: Public Properties
    
    var presenter: DetailInformationViewOutput?
    
    // MARK: Private Properties
    
    private enum Constants {
        static let nameImageForDownload = "arrow.down.circle"
        
        static let positionImageView = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: -16)
        static let nameImageForDefaultImageAvatar = "person.crop.circle"
        
        static let positionProgressBar = UIEdgeInsets(top: 32, left: 16, bottom: 0, right: -16)
        
        static let topPositionPlayButton: CGFloat = 32
        static let sizeForPlayButton: CGFloat = 64
        static let sizeForImageButton: CGFloat = 24
        static let nameImageForStatePlay = "play.fill"
        static let nameImageForStatePause = "pause.fill"
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = Colors.darkBlue
        imageView.image = UIImage(systemName: Constants.nameImageForDefaultImageAvatar)
        imageView.tintColor = Colors.blue
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        
        return imageView
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        progressView.trackTintColor = Colors.darkBlue
        progressView.progressTintColor = Colors.yellow
        
        progressView.progress = 0.0
        
        return progressView
    }()
    
    private lazy var playButton: UIButton = {
        let image = UIImage(systemName: Constants.nameImageForStatePlay,
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: Constants.sizeForImageButton))
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.clipsToBounds = true
        button.layer.cornerRadius = Constants.sizeForPlayButton / 2
        
        button.backgroundColor = Colors.darkBlue
        
        button.tintColor = Colors.gray
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(self.didTapPlayButton), for: .touchUpInside)
        
        return button
    }()
    
    private var model: TrackModel?
    private var isPlaying = false
    
    // MARK: Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("INIT : ✅ : DetailInformationViewController")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : DetailInformationViewController")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.gray
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: Constants.nameImageForDownload),
                                                                      style: .done,
                                                                      target: self,
                                                                      action: #selector(self.didTapRightBarButton))
        
        self.presenter?.viewDidLoad()
        
        self.drawSelf()
    }
    
    // MARK: Drawing
    
    private func drawSelf() {
        self.view.addSubview(self.backgroundImageView)
        self.view.addSubview(self.progressBar)
        self.view.addSubview(self.playButton)
        
        let constraintsForBackgroundImageView = self.constraintsForBackgroundImageView()
        let constraintsForProgressBar = self.constraintsForProgressBar()
        let constraintsForPlayButton = self.constraintsForPlayButton()
        
        NSLayoutConstraint.activate(
            constraintsForBackgroundImageView +
            constraintsForProgressBar +
            constraintsForPlayButton
        )
    }
    
    // MARK: Get NSLayoutConstraints
    
    private func constraintsForBackgroundImageView() -> [NSLayoutConstraint] {
        let frameSize = self.view.frame.width - (2 * Constants.positionImageView.left)
        
        let topAnchor = self.backgroundImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Constants.positionImageView.top)
        let leadingAnchor = self.backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Constants.positionImageView.left)
        let trailingAnchor = self.backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: Constants.positionImageView.right)
        let heightAnchor = self.backgroundImageView.heightAnchor.constraint(equalToConstant: frameSize)
        
        return [
            topAnchor, leadingAnchor, trailingAnchor, heightAnchor
        ]
    }
    
    
    private func constraintsForProgressBar() -> [NSLayoutConstraint] {
        let topAnchor = self.progressBar.topAnchor.constraint(equalTo: self.backgroundImageView.bottomAnchor, constant: Constants.positionProgressBar.top)
        let leadingAnchor = self.progressBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Constants.positionProgressBar.left)
        let trailingAnchor = self.progressBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: Constants.positionProgressBar.right)
        
        return [
            topAnchor, leadingAnchor, trailingAnchor
        ]
    }
    
    private func constraintsForPlayButton() -> [NSLayoutConstraint] {
        let centerXAnchor = self.playButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let topAnchor = self.playButton.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: Constants.topPositionPlayButton)
        let heightAnchor = self.playButton.heightAnchor.constraint(equalToConstant: Constants.sizeForPlayButton)
        let widthAnchor = self.playButton.widthAnchor.constraint(equalToConstant: Constants.sizeForPlayButton)
        
        return [
            centerXAnchor, topAnchor, heightAnchor, widthAnchor
        ]
    }
    
    // MARK: Private Methods
    
    @objc private func didTapRightBarButton(sender: UIBarButtonItem) {
        
    }
    
    @objc private func didTapPlayButton(sender: UIButton) {
        self.isPlaying.toggle()
        
        let imageForPlayButton = UIImage(systemName: self.isPlaying ? Constants.nameImageForStatePause : Constants.nameImageForStatePlay,
                                         withConfiguration: UIImage.SymbolConfiguration(pointSize: Constants.sizeForImageButton))
        sender.setImage(imageForPlayButton, for: .normal)
    }
}

// MARK: - DetailInformationViewInput

extension DetailInformationViewController: DetailInformationViewInput {
    
    func didObtainView(with model: TrackModel) {
        self.model = model
        
        self.navigationItem.title = model.name
    }
}
