# Movies App

A movies app with data fetched from the (https://developers.themoviedb.org/) website API. 

## Packages Used

*  get: ^4.6.5
*  dio: ^4.0.6
*  flutter_dotenv: ^5.0.2
*  flutter_bloc: ^8.1.1

## Brief Summary of the development process

* First things first, I observed the provided Figma design and made a constants file to store the constant values like background color, indicator color, button color, etc.
* After collecting the constant values, I started designing the UI and placed a local image/assets in order to picture how the design will end up in the end.
* I examined the API documentation after finishing the UI design in order to comprehend how the API functions and how to retrieve data from it.
* I realized that I'll need to put my personal API key in the file and repository. As we are not supposed to put the key in a public repository, I
  created an .env file, added the API key to it, and added the file to the gitignore. For accessing the stored API key,
  I used a package called flutter_dotenv.
* I used Postman for testing the API for now playing and animation movies. The main problem was how to get the animation movies. After using Postman and the official website, I realized we can retrieve it using the with_genres parameter.
* For the "now showing" section, I created a movie controller using GetX which implements the repository (the file where GET requests are made using the Dio package).
* For the "Animation Film" section, I created a three bloc files: movie_bloc, movie_event, and movie_state. 

## Screenshots