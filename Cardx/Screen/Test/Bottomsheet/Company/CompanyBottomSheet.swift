//
//  CompanyBottomSheet.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 16/04/21.
//

import UIKit

class CompanyBottomSheet: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var companyImgeView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var socialMediaView: UIStackView!
    @IBOutlet weak var goOutlet: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    //MARK: - Variables
//    var entrepreneurModel:EntrepreneurModel?
//    var company:Company!
//    var design:Design!
//    var scheduleList:[Schedule]?
//    var productList:[Product]?
//    var socialMediaList:[SocialMedia]?
//    var user:User!
    
    //MKAR: - Extra
//    var aux:GoToCompanyDelegate!
//    var vc:HomeViewController?
    
    
    //MARK: - BottomSheet
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
        
    }
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
    //IBActions
    @IBAction func goButton(_ sender: Any) {
        //MARK: - go to new viewController
        print("goButton")
//        goToCompany(company: company)
    }
    @IBAction func schedulesButton(_ sender: Any) {
        //MARK: - openDialog from schedule
        print("schedulesButton")
//        guard let scheduleList = scheduleList else { return }
//        print(scheduleList)
    }
}

extension CompanyBottomSheet{
    
    private func setupView(){
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        
        companyImgeView.layer.cornerRadius = 25
        goOutlet.layer.cornerRadius = 15
        socialMediaView.layer.cornerRadius = 15
        mainView.layer.cornerRadius = 25
        
    }
    private func setupData(){
//        guard let model = entrepreneurModel else { return }
//        company = model.company
//        design = model.design
        let imagePath = "https://idaxmx.com/Ventax/IMAGES/20_IDAX (VAX)/IDAX (VAX).jpg"
        
        goOutlet.backgroundColor? = .systemOrange.withAlphaComponent(0.7)
        socialMediaView.backgroundColor? = .systemOrange.withAlphaComponent(0.7)
        companyImgeView.imageFromServer(url: imagePath)
        
        nameLabel.text = "company.name"
        nameLabel.textColor = .black
        descriptionLabel.text = "company.description"
        descriptionLabel.textColor = .gray
        
        mainView.backgroundColor = .systemOrange.withAlphaComponent(0.7)
        //MARK: - fill socialMedia
        fillSocialMedia(socialMediaList: [
            SocialMedia(socialMediaId: 0, code: "idax.mx"),
            SocialMedia(socialMediaId: 1, code: "xchelcd"),
            SocialMedia(socialMediaId: 2, code: "XchelCarranza"),
            SocialMedia(socialMediaId: 3, code: "http://idaxmx.com"),
        ])
    }
    
//    private func showSchedules(scheduleList:[Schedule]){
//        
//    }
    
    private func fillSocialMedia(socialMediaList:[SocialMedia]){
        print(socialMediaList)
        for sm in socialMediaList{
            let button = XButton()
    
            let name = Util.getSocialMedia(socialMediaId: sm.socialMediaId)
            
            button.setImage(UIImage(named:name), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            button.socialMediaCode = sm.code
            button.socialMediaId = sm.socialMediaId
            button.addTarget(self, action: #selector(goToSocialMedia), for: .touchUpInside)
            
            socialMediaView.addArrangedSubview(button)
        }
    }
    
    @objc func goToSocialMedia(_ sender: XButton){
        Util.goToSocialMedia(socialMediaId: sender.socialMediaId!, code: sender.socialMediaCode!)
    }
    
//    private func goToCompany(company:Company){
//        //MARK: - Show new viewController
//        print("Pressed")
//        aux = vc!
//        aux.goToCompany()
//        /*
//        let v = UIViewController()
//        v.view.backgroundColor = .red
//        //v.navigationController?.navigationBar.isHidden = false
//        print(navigationController?.viewControllers.count ?? "Default")
//        navigationController?.navigationBar.isHidden = false
//        self.navigationController?.pushViewController(v, animated: true)
//        b = true
//        */
//    }
}

protocol GoToCompanyDelegate{
    //func goToCompany(entrepreneurModel:EntrepreneurModel, user:User)
    func goToCompany()
}


extension UIImageView{
    func imageFromServer(url:String){
        if self.image == nil{
            self.image = UIImage(named: "Ventax_logo")
        }
        
        let urlEncode = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        //print(url)
        //print(urlEncode)
        URLSession.shared.dataTask(with: URL(string: urlEncode)!){ (data, response, error) in
            if error != nil{
                return
            }
            DispatchQueue.main.async {
                guard let data = data else { return }
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
    
    func designImage1(){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 5, height: -5)
    }
}

struct SocialMedia: Codable{
    var socialMediaId:Int
    var code:String
    
    enum CodingKeys: String, CodingKey{
        case socialMediaId = "id"
        case code
    }
}

class XButton: UIButton{
    var socialMediaCode:String?
    var socialMediaId:Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

class Util{
    
    
    static func getSocialMedia(socialMediaId:Int) -> String{
        var socialMedia = ""
        
        switch socialMediaId {
        case 0:
            socialMedia = Constants.SOCIAL_MEDIA_FACEBOOK_IMG
        case 1:
            socialMedia = Constants.SOCIAL_MEDIA_INSTAGRAM_IMG
        case 2:
            socialMedia = Constants.SOCIAL_MEDIA_TWITTER_IMG
        default:
            socialMedia = Constants.SOCIAL_MEDIA_WEB_IMG
        }
        
        return socialMedia
    }
    
    static func goToSocialMedia(socialMediaId: Int, code:String) /*-> [String:String?]*/{
        var nameApp = ""
        var nameWeb = ""
        switch socialMediaId {
        case 0:
            nameApp = "\(Constants.APP_URL_FACEBOOK)"
            nameWeb = "\(Constants.WEB_URL_FACEBOOK)\(code)"
        case 1:
            nameApp = "\(Constants.APP_URL_INSTAGRAM)"
            nameWeb = "\(Constants.WEB_URL_INSTAGRAM)\(code)"
        case 2:
            nameApp = "\(Constants.APP_URL_TWITTER)"
            nameWeb = "\(Constants.WEB_URL_TWITTER)\(code)"
        case 3: nameWeb = code
        default:
            //MARK: - OPEN WHATS
            nameApp = "\(Constants.APP_URL_INSTAGRAM)"
        }
        
        let app = "\(nameApp)\(Constants.APP_URL)\(code)"
        let web = "\(nameWeb)"
        
        print(app)
        print(web)
        
        let appURL = NSURL(string: app)
        let webURL = NSURL(string: web)
        
        if UIApplication.shared.canOpenURL(appURL! as URL){
            if #available(iOS 10.0, *){
                UIApplication.shared.open(appURL! as URL, options: [:], completionHandler: nil)
            }else{
                UIApplication.shared.canOpenURL(appURL! as URL)
            }
        }else{
            if #available(iOS 10.0, *){
                UIApplication.shared.open(webURL! as URL, options: [:], completionHandler: nil)
            }else{
                UIApplication.shared.canOpenURL(webURL! as URL)
            }
        }
        
        /*return [
            "app":appURL?.absoluteString,
            "web:":webURL?.absoluteString
        ]*/
    }
}

class Constants{
    public static let VERSION = "v2/"
    public static let MAIN_URL = "https://idaxmx.com/Ventax/"
    public static let MIDDLE_URL = "interface.php?function="
    public static let END_POINT = "\(MAIN_URL)\(VERSION)\(MIDDLE_URL)"
    public static let IOS = 1
    
    public static let APP_URL_FACEBOOK = "fb"
    public static let APP_URL_INSTAGRAM = "instagram"
    public static let APP_URL_TWITTER = "twitter"
    public static let APP_URL_WHATS = ""
    public static let APP_URL = "://user?screen_name="
    
    public static let WEB_URL_FACEBOOK = "https://facebook.com/"
    public static let WEB_URL_INSTAGRAM = "https://instagram.com/"
    public static let WEB_URL_TWITTER = "https://twitter.com/"
    
    //MARK: - DRAWER
    public static let POS_MENU = 0
    public static let POS_PROFILE = 1
    public static let POS_CART = 2
    public static let POS_COMPANY = 3
    public static let POS_ORDER = 4
    public static let POS_PRODUCT = 5
    public static let POS_SETTINGS = 6
    public static let POS_FAQ = 7
    public static let POS_IDAX = 8
    public static let POS_LOG_OUT = 9
    
    
    //MARK: - PRIORITY -> ACCOUNT_TYPE
    public static let PRIORITY_BASIC = 0
    public static let PRIORITY_PREMIUM = 1
    public static let PRIORITY_BUSINESS = 2
    
    //MARK: - ITEMS
    public static let ITEM_BASIC = 10
    public static let ITEM_PREMIUM = 20
    public static let ITEM_BUSINESS = 40
    
    //MARK: - FAQs
    public static let FAQ_BASIC = 3
    public static let FAQ_PREMIUM = 8
    public static let FAQ_BUSINESS = 15
    
    //MARK: - TYPE -> COMPANY/CLIENT
    public static let CANCEL_BY_COMPANY = 12
    public static let CANCEL_BY_CLIENT = 13
    
    //MARK: - EXTRA
    public static let AFFILIATE = 1
    public static let NOT_AFFILIATE = 0
    public static let AS_COMPANY = 0
    public static let AS_USER = 1
    
    //MARK: - ORDER STATE
    public static let PENDING = 0
    public static let ACEPTED = 1
    public static let PROCCESS = 2
    public static let FINISHED = 3
    public static let CANCELED = 4
    
    //MARK: - TYPE VIEW -> COMPANY/USER
    public static let COMPANY_VIEW = 50//false
    public static let USER_VIEW = 51//true
    
    
    //MARK: - UserDefaults
    public static let APNsToken:String = "APNsToken"
    public static let IS_LOGGED_KEY = "IS_LOGGED_KEY"
    
    public static let SOCIAL_MEDIA_FACEBOOK_IMG = "socialmedia_facebook"
    public static let SOCIAL_MEDIA_TWITTER_IMG = "socialmedia_twitter"
    public static let SOCIAL_MEDIA_INSTAGRAM_IMG = "socialmedia_instagram"
    public static let SOCIAL_MEDIA_WEB_IMG = "socialmedia_web"
    public static let SOCIAL_MEDIA_WHATS_IMG = "socialmedia_whats"
}
