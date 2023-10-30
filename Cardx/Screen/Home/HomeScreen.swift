//
//  HomeScreen.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol HomeScreenCoordinator {
    func navigateToTestScreen()
    func navigateToAddCards()
    //func navigateToDisplayCards()
    func navigateToSettingScreen()
    func navigateToDisplayCards() // MARK: - move to another previous screen playScreen -> displayScreen
}

class HomeScreen: UIViewController {
    
    let button: UIButton = UIButton()
    
    private let coordinator: HomeScreenCoordinator
    
    init(coordinator: HomeScreenCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
#if DEBUG
        print(_tag, "uuid: \(UUID())")
        print(_tag, "uuid: \(UUID())")
        print(_tag, "uuid: \(UUID())")
        print(_tag, "uuid: \(UUID())")
        print(_tag, "uuid: \(UUID())")
#endif
//        if let apiKey = ProcessInfo.processInfo.environment["deepl_key"] {
//            print(_tag, apiKey)
//        } else {
//            print(_tag, "No key")
//        }
    }
    @IBAction func testButton(_ sender: UIButton) {
        coordinator.navigateToTestScreen()
    }
    
    @IBAction func addNewCard(_ sender: UIButton) {
        coordinator.navigateToAddCards()
    }
    
    @IBAction func displayCards(_ sender: UIButton) {
//        let bottomSheet = CompanyBottomSheet()
//        bottomSheet.modalPresentationStyle = .custom
//        bottomSheet.transitioningDelegate = self
//        self.present(bottomSheet, animated: true, completion: nil)
//        self.navigationController?.pushViewController(DisplayCardsScreen(coordinator: nil, viewModel: DisplayCardViewModel()), animated: true)
        coordinator.navigateToDisplayCards()
    }
    
    @IBAction func openSettings(_ sender: UIButton) {
        coordinator.navigateToSettingScreen()
    }
    
}


extension HomeScreen: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

class PresentationController: UIPresentationController {

  let blurEffectView: UIVisualEffectView!
  var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
  
  override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
      let blurEffect = UIBlurEffect(style: .dark)
      blurEffectView = UIVisualEffectView(effect: blurEffect)
      super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
      tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
      blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      self.blurEffectView.isUserInteractionEnabled = true
      self.blurEffectView.addGestureRecognizer(tapGestureRecognizer)
  }
  
  override var frameOfPresentedViewInContainerView: CGRect {
      CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height * 0.4),
             size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height *
              0.6))
  }

  override func presentationTransitionWillBegin() {
      self.blurEffectView.alpha = 0
      self.containerView?.addSubview(blurEffectView)
      self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
          self.blurEffectView.alpha = 0.7
      }, completion: { (UIViewControllerTransitionCoordinatorContext) in })
  }
  
  override func dismissalTransitionWillBegin() {
      self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
          self.blurEffectView.alpha = 0
      }, completion: { (UIViewControllerTransitionCoordinatorContext) in
          self.blurEffectView.removeFromSuperview()
      })
  }
  
  override func containerViewWillLayoutSubviews() {
      super.containerViewWillLayoutSubviews()
      presentedView!.roundCorners(corners: [.topLeft, .topRight], radius: 25)
  }

  override func containerViewDidLayoutSubviews() {
      super.containerViewDidLayoutSubviews()
      presentedView?.frame = frameOfPresentedViewInContainerView
      blurEffectView.frame = containerView!.bounds
  }

  @objc func dismissController(){
      self.presentedViewController.dismiss(animated: true, completion: nil)
  }
}


