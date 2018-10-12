# MuslimData

[![CI Status](https://img.shields.io/travis/KosratDAhmad/MuslimData.svg?style=flat)](https://travis-ci.org/KosratDAhmad/MuslimData)
[![Version](https://img.shields.io/cocoapods/v/MuslimData.svg?style=flat)](https://cocoapods.org/pods/MuslimData)
[![License](https://img.shields.io/cocoapods/l/MuslimData.svg?style=flat)](https://cocoapods.org/pods/MuslimData)
[![Platform](https://img.shields.io/cocoapods/p/MuslimData.svg?style=flat)](https://cocoapods.org/pods/MuslimData)

MuslimData is an Islamic library that provides Prayer Times (fixed and calculated), Offline Geocoder, and Location Search.

**Fixed and Calculated Prayer Times**:
Most cities around the world find their prayer times by using some calculations which is based on location (longitude and latitude) but some other cities have fixed time table for their prayer times. This library contains most fixed and calculated prayer times. Now you can contribute it to improve it and also you can use it in Muslim communities or Muslim apps.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 10.0+
* Xcode 10.0+

## Installation

MuslimData is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MuslimData'
```

## Usage 

### Location Helper 

There are some location helper methods that provides **offline** Location Search, Geocoder, Reverse Geocoder, and check a city for fixed prayer times.


#### Search for location

You can search for any cities or places around the world and this is useful when a use doesn't have internet connection or user's location is turned off so you can search here:
```swift
LocationHelper.shared.citySearch(city: "London") { locations, error in
    guard let locations = locations, locations.count > 0 else {
        print("City could not be found!")
        return
    }
    print("locations: \(locations)")
}
```

#### Geocoder 

Use geocoder to find city location by name.

```swift
// Use geocoder to find city location by name.
LocationHelper.shared.geocoder(countryCode: "GB", city: "London") { location in
    guard let location = location else {
        print("City name can not be geocode")
        return
    }
    print("location: \(location)")
}
```

#### Reverse Geocoder

Use reverse geocoder to find city name by latitude and longitude.

```swift 
// Use reverse geocoder to find city name by latitude and longitude.
LocationHelper.shared.geocoder(latitude: 36.654090, longitude: 44.541278) { (location) in
    guard let location = location else {
        print("City name can nnot be geocode by latitude and longitude")
        return
    }
    print("location: \(location)")
}
```

#### Has Fixed Prayer Times

Check a city to know that it has fixed prayer times or not

```swift
// Check a city to know that it has fixed prayer times or not
LocationHelper.shared.cityHasFixedPrayerTimes(countryCode: "IQ", city: "Duhok") { (hasFixed) in
    print("City has fixed prayer times: \(hasFixed)")
}
```

### Prayer Times 

You can easily get a location prayer times just by passing (`Location`, `PrayerAttribute`, and `Date`) object to `getPrayerTimes` method.

```swift 
// Create location object.
let location = Location(latitude: 36.123, longitude: 44.123, city: "Erbil", countryCode: "IQ",
                        countryName: "Iraq", hasFixedPrayerTimes: true)

// Crate prayer attributes object.
let attributes = PrayerAttribute(method: .makkah, asrMethod: .shafii, adjustAngle: .angleBased)

// Get prayer times
PrayerTime.getPrayerTimes(location: location, date: Date(), attributes: attributes) { prayerTime, error in
    guard error == nil else {
        print("Prayer tims didn't found for the specified properties.")
        return
    }
    print("prayer times: \(prayerTime!)")
    print("Fromat prayer times: \(prayerTime!.formatPrayers(.time12))")
    print("Format one prayer time: \(prayerTime!.isha.toTime(format: .time24))")
    print("next prayer index: \(prayerTime!.nextPrayerIndex())")
    print("next prayer interval: \(prayerTime!.nextPrayerInterval())")
    print("next prayer time remaining: \(prayerTime!.nextPrayerTimeRemaining())")
}
```
### Names of Allah 

Get 99 Names of Allah with it's translation and now it is available for these languages (`en`, `ar`, `ckb`, `fa`, and `ru`)

```swift
// Get 99 names of allah from MuslimData library
Names.names(language: .en) { names, error in
    guard error == nil else {
        print("Names of Allah didn't found: \(error!)")
        return
    }
    print("Names of Allah: \(names)")
} 
```
## Author

Kosrat D. Ahmad, kosrat.d.ahmad@gmail.com

## License

MuslimData is available under the MIT license. See the LICENSE file for more info.
