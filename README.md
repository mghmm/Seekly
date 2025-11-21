# Seekly

Seekly is a modern iOS map application built with SwiftUI that helps users discover nearby businesses and locations through an intuitive, map-based interface.

## 🎯 Overview

Seekly provides a seamless experience for finding local businesses with real-time location tracking, interactive map markers, and detailed business information. The app features a clean, minimal design with custom emoji-based markers and smooth animations.

## ✨ Features

### Core Functionality
- **Interactive Map View**: Real-time map with custom business markers and user location tracking
- **Directional Heading**: Visual cone showing your current direction on the map
- **Smart Search**: Search for businesses with natural language queries
- **Business Details**: Comprehensive information including ratings, reviews, pricing, hours, and contact details
- **Distance Calculation**: Shows real-time distance to nearby businesses

### User Interface
- **Custom Business Markers**: Emoji-based markers for easy visual identification
- **Animated Marker Selection**: Smooth zoom and focus animations when selecting businesses
- **Search Sheet**: Slide-up search interface with filtered business results
- **Detail Sheet**: Partial-screen business detail view with background map interaction
- **Modern Design**: Clean UI with gradient accents and thoughtful spacing

## 🛠 Technology Stack

- **Framework**: SwiftUI
- **Mapping**: MapKit with custom annotations and camera positioning
- **Location Services**: CoreLocation with heading updates
- **Architecture**: MVVM pattern with separate managers, models, views, and view models
- **Platform**: iOS (requires iOS 17+)

## 📁 Project Structure

```
Seekly/
├── SeeklyApp.swift          # App entry point
├── Views/
│   ├── ContentView.swift    # Main view with search bar
│   ├── MapView.swift        # Interactive map with markers
│   ├── SearchSheet.swift    # Search results interface
│   └── BusinessDetailSheet.swift  # Business detail view
├── Models/
│   ├── Business.swift       # Business data model
│   └── SampleData.swift     # Sample business data
├── Managers/
│   └── LocationManager.swift  # Location and heading services
├── ViewModels/              # View model layer (planned)
└── Services/                # Service layer (planned)
```

## 🚀 Getting Started

### Requirements
- Xcode 15.0 or later
- iOS 17.0 or later
- macOS Sonoma or later

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/Seekly.git
cd Seekly
```

2. Open the project in Xcode:
```bash
open Seekly.xcodeproj
```

3. Build and run the project (⌘R)

### Location Permissions

The app requires location permissions to show your current position. On first launch, grant "While Using the App" location access when prompted.

## 🗺 Key Components

### MapView
- Displays user location with custom blue dot and directional cone
- Shows business markers with emoji icons
- Handles marker selection and map camera animations
- Integrates with location manager for real-time updates

### Business Model
Each business includes:
- Name, category, and emoji icon
- Star rating and review count
- Price level (1-4 dollar signs)
- Distance from user location
- Operating hours (open/closed status)
- Address and phone number
- Geographic coordinates

### Search Functionality
- Natural language search queries
- Filter businesses by category, name, or type
- List view with business details and sorting
- Quick access to business information

## 🎨 Design Highlights

- **Purple Gradient Theme**: Modern purple gradient for primary actions
- **Emoji Icons**: Intuitive emoji-based business markers
- **Smooth Animations**: Spring and easing animations throughout
- **Sheet Presentations**: Modern iOS sheet presentations with drag indicators
- **Realistic Map Style**: 3D terrain with elevation for better context

## 🔮 Future Enhancements

- AI-powered search and recommendations
- Integration with real business APIs (Yelp, Google Places)
- Route navigation to selected businesses
- Favorite locations and saved searches
- User reviews and photos
- Dark mode optimization

## 👨‍💻 Development

### Current Status
The app currently uses sample data for demonstration purposes. The architecture is designed to easily integrate with real business data APIs and AI services.

### Adding New Features
The modular architecture makes it easy to extend:
- Add new views in the `Views/` folder
- Implement business logic in `ViewModels/`
- Add data services in `Services/`
- Extend the `Business` model for additional properties

## 📱 Screenshots

[Screenshots coming soon]

## 📄 License

This project is created by Mike Merkelbag.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

---

Built with ❤️ using SwiftUI
