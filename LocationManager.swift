//
//  LocationManager.swift
//  Weather
//
//  Created by Ravi Chokshi on 15/02/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import UIKit
import CoreLocation


class LocationManager: NSObject,CLLocationManagerDelegate
{

    //Location manager
    var m_GPSCoordinate = CLLocationCoordinate2D()
    var m_LocationManager: CLLocationManager?
    var m_iGPSStatus: Int = 0
    var _deferringUpdates = false
    
    override init() {
      
        super.init()
    }
    
    // MARK: - GPS Methods
    func start_GPS()
    {
        m_GPSCoordinate.longitude = 0.0
        m_GPSCoordinate.latitude = 0.0
        m_iGPSStatus = 0
      //  m_LocationManager?.stopUpdatingLocation()
        //m_LocationManager?.stopMonitoringSignificantLocationChanges()
        
        m_LocationManager?.requestWhenInUseAuthorization()
        
        m_LocationManager?.allowsBackgroundLocationUpdates = true
                
        m_LocationManager?.startUpdatingLocation()
    }
    
    func stop_GPS() {
        m_LocationManager?.stopUpdatingLocation()
        m_LocationManager?.stopMonitoringSignificantLocationChanges()
    }
    
    func init_GPS()
    {
        m_iGPSStatus = 0
        m_LocationManager = CLLocationManager()
        m_LocationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        m_LocationManager?.delegate = self
        m_LocationManager?.distanceFilter = kCLDistanceFilterNone
        m_LocationManager?.pausesLocationUpdatesAutomatically = false
        m_LocationManager?.allowsBackgroundLocationUpdates = true
        
        m_LocationManager?.activityType = .automotiveNavigation
    }
    
    func whenappResignActive()
    {
        m_LocationManager?.stopUpdatingLocation()
        m_LocationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        m_LocationManager?.distanceFilter = kCLDistanceFilterNone
        m_LocationManager?.pausesLocationUpdatesAutomatically = false
        m_LocationManager?.activityType = .automotiveNavigation
        m_LocationManager?.startUpdatingLocation()

    }
    // MARK: - locationManager delegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        // print("UPDATING")
        let newLocation: CLLocation? = locations.last
        m_GPSCoordinate = (newLocation?.coordinate)!
        
        selectedLattitude = m_GPSCoordinate.latitude
        selectedLongitude = m_GPSCoordinate.longitude
        
       // NSLog("SelectedLattitude = %f SelectedLongitude = %f" , selectedLattitude,selectedLongitude)
        
        if (appDel?._isBackgroundMode)! && !_deferringUpdates
        {
            _deferringUpdates = true
            
            m_LocationManager?.allowDeferredLocationUpdates(untilTraveled: CLLocationDistanceMax, timeout: CLTimeIntervalMax)
        }

        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?)
    {
        print("didFinishDeferredUpdatesWithError error = \(error.debugDescription)")
        
        print("FINISHED BACKGROUND UPDATE with error \(error)")
        if (error != nil)
        {
            print("ERROR IS VALID as CLError")
            
            if (error!._code == CLError.locationUnknown.rawValue)
            {
                print("Error: Location Unknown")
            } else if (error!._code == CLError.deferredAccuracyTooLow.rawValue)
            {
                print("Error: Accuracy too low")
            } else if (error!._code == CLError.deferredFailed.rawValue)
            {
                print("Error: Deferring Failed")
            } else if (error!._code == CLError.denied.rawValue)
            {
                print("Error: Denied")
            } else
            {
                print("Error not handled")
            }
            
        }
        
        _deferringUpdates = false

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("locationManager failed")
        m_iGPSStatus = 1
    }
   public func isLocationPermissionGrantedWithAlwaysAllow() -> Bool
    {
        guard CLLocationManager.locationServicesEnabled() else { return false }
        return [.authorizedAlways].contains(CLLocationManager.authorizationStatus())
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        print("Status = \(status.hashValue)")
        
            switch status {
            case .notDetermined:
                // If status has not yet been determied, ask for authorization
                manager.requestWhenInUseAuthorization()
                break
            case .authorizedWhenInUse:
                // If authorized when in use
                manager.startUpdatingLocation()
                break
            case .authorizedAlways:
                // If always authorized
                manager.startUpdatingLocation()
                break
            case .restricted:
                // If restricted by e.g. parental controls. User can't enable Location Services
                break
            case .denied:
                // If user denied your app access to Location Services, but can grant access from Settings.app
                break
            default:
                break
            }
        
    }
    

    
    public func askForPermission()  {
        // For use in foreground
        self.m_LocationManager!.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            m_LocationManager!.delegate = self
            m_LocationManager!.desiredAccuracy = kCLLocationAccuracyBest
            m_LocationManager!.startUpdatingLocation()
        }
        
    }
    
}

