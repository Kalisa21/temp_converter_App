# Temperature Converter App

A Flutter application that allows users to convert temperatures between Fahrenheit and Celsius. The app features a clean and intuitive user interface where users can input a temperature, select the conversion type, and view the converted result. Additionally, the app maintains a history of previous conversions.

## Table of Contents

1. [Features](#features)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Project Structure](#project-structure)
5. [Code Overview](#code-overview)
6. [Usage](#usage)
7. [Customization](#customization)
8. [Screenshots](#screenshots)
9. [License](#license)

## Features

- Convert temperatures between Fahrenheit and Celsius.
- Keeps a history of all conversions made during the session.
- Responsive design for both portrait and landscape orientations.
- Customizable theme with default green colors.
- Input validation to ensure only valid numbers are converted.

## Prerequisites

- Flutter SDK installed ([Installation Guide](https://flutter.dev/docs/get-started/install)).
- Dart SDK (bundled with Flutter).
- Android Studio or Visual Studio Code with Flutter plugins.
- Physical or virtual device (emulator) for testing.

## Installation

1. Clone the repository:



Code Overview
Entry Point
The app starts with the main() function, which initializes the app by calling runApp() on the TemperatureConverterApp widget.

TemperatureConverterApp
This stateless widget defines the overall theme and home screen of the app.

TemperatureConverterScreen
A stateful widget that contains:

A TextField for user input.
Radio buttons to select between Fahrenheit to Celsius (F to C) and Celsius to Fahrenheit (C to F).
A button to trigger the conversion.
Displays the converted temperature and a history of conversions.
Conversion Logic
The app supports two types of conversions:

Fahrenheit to Celsius: 
𝐶
=
(
𝐹
−
32
)
×
5
9
C= 
9
(F−32)×5
​
 
Celsius to Fahrenheit: 
𝐹
=
𝐶
×
9
5
+
32
F= 
5
C×9
​
 +32
Converted results are displayed to two decimal places and stored in the conversion history list.

Conversion History
The app maintains a list of conversions made during the session and displays them in a ListView.

Usage
Input a numerical temperature value.
Choose either "Fahrenheit to Celsius" or "Celsius to Fahrenheit."
Press the CONVERT button.
View the converted temperature and the conversion history.