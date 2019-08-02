//
//  MainBuyInsuranceViewController.swift
//  TPLInsurance
//
//  Created by Tahir Raza on 08/10/2018.
//  Copyright © 2018 TPLHolding. All rights reserved.
//

import UIKit

class MainBuyInsuranceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    let InsuranceType = ["Car Insurance", "Mobile Insurance", "Home Insurance", "Travel Insurance"]
    let InsuranceType = ["Travel Insurance", "Home Insurance", "Car Insurance", "Travel2 Insurance", "Mobile Insurance"]
    let InsuranceDetails = ["Get peace of mind for wherever the road takes you", "Safe travels, we have got you covered", "All your protection under one roof", "Covering you for the unexpected", "Mobile Insurance"]
    let InsuranceTypeImages = ["vehicle_claim", "home_insuranceLogo", "travel_claim", "travel_claim", "mobile_claim"]
    let insuranceDialogDetails = ["1. Personal CNIC\n  2. Beneficiary CNIC\n  3. Beneficiary Address\n", "1. Personal CNIC\n  2. Tenant /  Landlord CNIC\n", "1. Personal CNIC\n 2. Engine # \n 3. Chasis No \n 4. Vehicle registration No\n" , "1. Mirror Screen Picture of Phone \n ,  Pic of box with IMEI , Pic of purchase receipt , Pic of CNIC"]
    let generalDialogDetail = "Please make sure you have the below information ready, while filling out the form:\n"

//    let defaultAction = UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { [weak self](action) in
//
//    })
    

    
//    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
//    print("Handle Ok logic here")
//    }))
    
    @IBOutlet weak var dataTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataTable.delegate = self
        dataTable.dataSource = self
        
        self.navigationItem.title = "Buy Insurance"
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) //UIColor(red: 227.0/255.0, green: 118.0/255.0, blue: 57.0/255.0, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = UIColor(red: 243.0/255.0, green: 111.0/255.0, blue: 33.0/255.0, alpha: 1.0)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor(red: 117.0/255.0, green: 117.0/255.0, blue: 117.0/255.0, alpha: 1.0)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = true
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return InsuranceType.count
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellInsuranceType")
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
//        cell?.textLabel?.text = "Car Insurance"
        cell?.imageView?.image = UIImage(named: InsuranceTypeImages[indexPath.row])
        cell?.textLabel?.text = InsuranceType[indexPath.row]
        cell?.detailTextLabel?.text = InsuranceDetails[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let defaultAcction = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default) { (UIAlertAction) in
//            var iType = self.InsuranceType[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
            if self.InsuranceType[indexPath.row] == self.InsuranceType[0]{
                self.performSegue(withIdentifier: "request qoute", sender: self)
            }else if self.InsuranceType[indexPath.row] == self.InsuranceType[1]{
                self.performSegue(withIdentifier: "showHome", sender: self)
            }else if self.InsuranceType[indexPath.row] == self.InsuranceType[2]{
                self.performSegue(withIdentifier: "showTravel", sender: self)
            }else if self.InsuranceType[indexPath.row] == self.InsuranceType[3]{
                self.performSegue(withIdentifier: "showTravelNew", sender: self)
            }else if self.InsuranceType[indexPath.row] == self.InsuranceType[4]{
                self.performSegue(withIdentifier: "showMobile", sender: self)
            }
        }
        
        TIHelper.showAlert(ViewController: self, AlertTitle: "Request Alert", AlertMessage: "\(generalDialogDetail)\n \(insuranceDialogDetails[indexPath.row])", AlertStyle: .alert , Actions: [defaultAcction])
       

    }

}


//Live urls

//    static let getCities = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetCity"
//    static let getAreas = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetArea/{CityId}"
//    static let getWorkshops = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetWorkshopList/{CityId}/{AreaId}"

//    static let getNotificationSettings = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetNotificationSettings"
//    static let addNotificationSettings = "http://customer.tplinsurance.com/tdiapp_api/api/Home/AddNotificationSettings"
//    static let addNotificationAcceptance = "http://customer.tplinsurance.com/tdiapp_api/api/Home/AddNotificationAcceptance"

//    //Live urls dated 26/nov
//    static let registerUser = "http://customer.tplinsurance.com/tdiapp_api/api/Home/RegisterUser/"
//    static let loginUser = "http://customer.tplinsurance.com/tdiapp_api/api/Home/LoginUser"

//    static let getMaintenanceVehicle = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetMaintenanceVehicle/"
//    static let getMaintenanceSchedule = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetMaintenanceSchedule/"
//    static let addMaintenanceSchedule = "http://customer.tplinsurance.com/tdiapp_api/api/Home/AddMaintenanceSchedule"
//    static let addMaintenanceVehicle = "http://customer.tplinsurance.com/tdiapp_api/api/Home/AddMaintenanceVehicle"
//    static let getAutoPackages = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetAutoPackages/{InsuranceType}/{MakeId}/{ModelId}/{Variant}/{ModelYear}"

//    static let getVehicleMake = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetMakeModelVariant/0/0/0"
//    static let getProvince = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetProvince"
//    static let getVehicleModel = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetMakeModelVariant/{MakeId}/M/{PackageId}"
//    static let getVehicleModelVariant = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetMakeModelVariant/{ModelId}/V/{PackageId}"
//    static let getValueAddedFeature = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetValueAddedFeatures/{ModelId}/{ModelYear}/{PackageId}"
//    static let getAutoQoute = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetAutoQuote/{MobileNo}/{PackageId}/{ModelId}/{Variant}/{ModelYear}/{SumInsured}/{Province}/{VAFlist}"
//    static let insertAutoPurposal = "http://customer.tplinsurance.com/tdiapp_api/api/Home/InsertAutoProposal"

// MARK: - New Api's For UAT

//    static let getAutoPackagesDetails = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetAutoPackageDetail"
//    static let getVAF = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetAutoPackageVAFs"
//    static let newGetAutoQoute = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetAutoQuoteNew/{MobileNo}/{PackageId}/{ModelId}/{Variant}/{ModelYear}/{SumInsured}/{Province}/{VAFlist}"
//    static let newInsertAutoPurposal = "http://customer.tplinsurance.com/tdiapp_api/api/Home/InsertAutoProposalNew"
//    static let newGetNotification = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetNotificationList"
//    static let getSurveyorAppointment = "http://customer.tplinsurance.com/tdiapp_api/api/Home/AddSurveyorAppointment"

//    static let getCnicCode = "http://customer.tplinsurance.com/tdiapp_api/api/Home/RegisterCustomer"
//    static let verifyCnicCode = "http://customer.tplinsurance.com/tdiapp_api/api/Home/VerifyCode"

//    // Mobile insurance apis

//    static let GetMobileQuote = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetMobileQuote"
//    static let getMobilePackages = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetMobilePackages"
//    static let InsertMobilePurposal = "http://customer.tplinsurance.com/tdiapp_api/api/Home/InsertMobileProposal"
//    static let postFeedback = "http://customer.tplinsurance.com/tdiapp_api/api/Home/ClaimFeedback"

//    static let getHelpTypes = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetHelpType"
//    static let contactUs = "http://customer.tplinsurance.com/tdiapp_api/api/Home/ContactUs"

//    static let myPolicies = "http://customer.tplinsurance.com/tdiapp_api/api/Home/MyPolicies"
//    static let updatePolicy = "http://customer.tplinsurance.com/tdiapp_api/api/Home/UpdatePolicy"
//    static let getUserProfile = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetCustomerProfile/"

//    static let updateUserProfile = "http://customer.tplinsurance.com/tdiapp_api/api/Home/AddCustomerRequest"

//    static let reRegisterUser = "http://customer.tplinsurance.com/tdiapp_api/api/Home/ReRegisterUser"
//    static let vehicleProfile = "http://customer.tplinsurance.com/tdiapp_api/api/Home/VehicleProfile"
//    static let getVehicleProfile = "http://customer.tplinsurance.com/tdiapp_api/api/Home/VehicleProfile"
//    static let getDamageParts = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetDamageParts/"
//    static let getImageList = "http://customer.tplinsurance.com/tdiapp_api/api/Home/GetImageList/{Type}"

//    // NEW Login and Register, Change password URL:
//    static let loginCustomer = "http://customer.tplinsurance.com/tdiapp_api/api/Home/LoginCustomer"
//    static let registerCustomer = "http://customer.tplinsurance.com/tdiapp_api/api/Home/RegisterCustomer"
//    static let changePassword = "http://customer.tplinsurance.com/tdiapp_api/api/Home/ChangePassword"
//    static let forgotPassword = "http://customer.tplinsurance.com/tdiapp_api/api/Home/ForgotPassword/{MobileNo}"
//    static let addClaim = "http://customer.tplinsurance.com/tdiapp_api/api/Home/AddClaimIntimation"



