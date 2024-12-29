//
//  AppDelegate.swift
//  BankApp
//
//  Created by Sena Küçükerdoğan on 27.12.2024.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
//    var hasOnboard = false

    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
//    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()

    func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
        let vc = mainViewController
        vc.setStatusBar()
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
        
        window?.rootViewController = vc
        
        return true
        
/*
//        dummyViewController.logoutDelegate = self

        window?.rootViewController = AccountSummaryViewController()
        // window?.rootViewController = mainViewController
        //        window?.rootViewController = onboardingContainerViewController
        //        window?.rootViewController = loginViewController
        //        window?.rootViewController = LoginViewController()
        //        window?.rootViewController = OnboardingContainerViewController()
        //        window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")
        mainViewController.selectedIndex = 1
        return true
 */
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window, duration: 0.7, options: .transitionCrossDissolve,
            animations: nil, completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        //window?.rootViewController = onboardingContainerViewController
//        if hasOnboard {
//            setRootViewController(dummyViewController)
//        } else {
//            setRootViewController(onboardingContainerViewController)
//        }
        if LocalState.hasOnboarded {
//            setRootViewController(dummyViewController)
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }

    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
//        hasOnboard = true
        LocalState.hasOnboarded = true
//        setRootViewController(dummyViewController)
        setRootViewController(mainViewController)
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}
