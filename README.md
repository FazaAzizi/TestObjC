## Overview
This iOS application demonstrates core Objective-C concepts by fetching and displaying user posts from a REST API. The app features a clean, modern interface with a master-detail flow: a list of posts and a detailed view for each post.

## Features
- Fetches user posts from JSONPlaceholder API
- Displays posts in a customized UITableView
- Shows detailed information when a post is selected

## Screenshots
![list](https://github.com/user-attachments/assets/2cfcddda-198f-40c9-9ec7-dc8f2be71843)
![search](https://github.com/user-attachments/assets/61835a41-2c99-4cf1-9172-aad83cfd5506)
![detail](https://github.com/user-attachments/assets/c3d724fe-cbc1-4c88-ac87-3ff07b82e34e)

## Technical Implementation
The application follows a simple MVC architecture with these key components:
- Models: UserModel class storing post data (title, ID, userID, and body)
- Views: Custom table view cells displaying post information
- Controllers: View controllers managing the list and detail screens
- Networking: Fetches data from JSONPlaceholder API using NSURLSession
