# Rails News Search App External API

This is a simple web application built using Ruby on Rails 7 that allows users to search for news articles based on a keyword and their location. The application uses the GNews API to fetch news articles and the Geocoder gem to get the user's location based on their IP address.

### Installation

1. Clone the repository: git clone https://github.com/your-username/news-search-app.git
2. Install dependencies: bundle install
3. Set up environment variables by creating a .env file in the root directory and adding the following: API_KEY=your-api-key
4. Start the server: rails server
5. Open the application in your web browser by navigating to http://localhost:3000

### Usage

The application has two main functionalities: searching for news articles and displaying the search results.

### Search For News Articles

To search for news articles, simply enter a keyword in the search bar on the homepage and click the "Search" button. The application will fetch news articles related to the keyword and display them on the search results page.

### Displaying Search Results

The search results page will display a list of news articles that match the search query. Each article will display its title, description, source, and date published.

## Code Structure

app/controllers/news_controller.rb

This file contains the logic for the NewsController class, which handles the rendering of the homepage and the search results page. It also uses the NewsService and LocationService classes to fetch news articles and get the user's location, respectively.

app/services/news_service.rb

This file contains the logic for the NewsService class, which is responsible for fetching news articles from the GNews API. It uses the open-uri and json libraries to make HTTP requests and parse the response.

app/services/location_service.rb

This file contains the logic for the LocationService class, which is responsible for getting the user's location based on their IP address. It uses the geocoder gem to perform the location lookup.

#### Gemfile

This file lists all the dependencies required for the application to run. It includes the dotenv-rails, json, and geocoder gems, among others.

### Testing

The application includes unit tests for the LocationService class using the rspec-rails and rails-controller-testing gems. To run the tests, simply run bundle exec rspec in the terminal.

### Deployment
