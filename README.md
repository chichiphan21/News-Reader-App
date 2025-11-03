# News Reader App
Phan Thị Chi - 22GIT
A Flutter application that fetches and displays real-time news articles from [NewsAPI.org](https://newsapi.org/).


Uploading read.mov…


## Features

- ✅ Fetch news from NewsAPI.org using REST API
- ✅ Display articles in a list with thumbnails
- ✅ View article details
- ✅ Category filtering (Business, Entertainment, Health, Science, Sports, Technology)
- ✅ Pull-to-refresh functionality
- ✅ Error handling with user-friendly messages
- ✅ Loading indicators
- ✅ Responsive UI with Material Design 3

## Technical Stack

- **Flutter SDK**: 3.0+
- **Dart**: 3.0+
- **Packages**:
  - `http` ^1.1.0 - For making HTTP requests
  - `intl` ^0.18.1 - For date formatting
- **Architecture**: FutureBuilder for async data handling

## Setup Instructions

### 1. Get Your API Key

1. Go to [NewsAPI.org](https://newsapi.org/)
2. Sign up for a free account
3. Copy your API key from the dashboard

### 2. Configure the API Key

Open `lib/services/news_api_service.dart` and replace `YOUR_API_KEY_HERE` with your actual API key:

```dart
static const String _apiKey = 'YOUR_ACTUAL_API_KEY';
```

### 3. Install Dependencies

Run the following command in the project directory:

```bash
flutter pub get
```

### 4. Run the App

```bash
flutter run
```

Or select a device in VS Code and press F5 to run in debug mode.

## Project Structure

```
lib/
├── main.dart                      # App entry point
├── models/
│   └── article.dart              # Article and NewsResponse models
├── services/
│   └── news_api_service.dart     # API service for fetching news
└── screens/
    ├── news_list_screen.dart     # Main screen with news list
    └── news_detail_screen.dart   # Article detail screen
```

## Features Breakdown

### FutureBuilder Implementation
- Used in `news_list_screen.dart` to handle async API calls
- Manages three states: loading, error, and success
- Provides smooth user experience during data fetching

### Error Handling
- Network errors with retry option
- API key validation errors
- Rate limit handling
- Empty state handling
- Image loading error handling

### Loading Indicators
- Circular progress indicator for initial loading
- Shimmer effect for image loading
- Pull-to-refresh indicator

### User Interface
- Material Design 3 with modern UI
- Category chips for easy filtering
- Card-based article display
- Responsive image handling
- Formatted dates and times

## API Endpoints Used

1. **Top Headlines**: `/v2/top-headlines`
   - Fetches breaking news by category
   - Parameters: country, category, pageSize

2. **Everything** (optional): `/v2/everything`
   - Search for specific topics
   - Parameters: query, sortBy, pageSize

## Testing the App

1. **Test Loading State**: 
   - Run the app with slow network to see loading indicators

2. **Test Error Handling**:
   - Use invalid API key to see error messages
   - Turn off internet to test network errors

3. **Test Categories**:
   - Switch between different news categories
   - Verify that articles update accordingly

4. **Test Article Details**:
   - Tap on any article to view details
   - Test the share functionality

## Known Limitations

- NewsAPI free tier has rate limits (100 requests/day for development)
- Some articles may have limited content (use "Read Full Article" button)
- Images may not load if URL is invalid

## Future Enhancements

- [ ] Search functionality
- [ ] Bookmarks/favorites
- [ ] Dark mode
- [ ] Share to social media
- [ ] Open articles in WebView
- [ ] Offline caching

## Troubleshooting

### "Invalid API key" error
- Verify you've replaced `YOUR_API_KEY_HERE` with your actual key
- Check that your API key is active on NewsAPI.org

### No articles loading
- Check your internet connection
- Verify you haven't exceeded your daily API request limit
- Try a different news category

### Images not loading
- This is normal for some articles with invalid image URLs
- The app shows a placeholder icon in such cases

## License

This project is for educational purposes.

## Credits

- News data provided by [NewsAPI.org](https://newsapi.org/)
- Built with Flutter by Google
