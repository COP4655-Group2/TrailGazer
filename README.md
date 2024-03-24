# TrailGazer
CodePath iOS102 Module 7-10 Group Project
===

# TrailGazer

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

****PROGRESS GIF AS OF WEEK 2****
![Progress GIF](https://github.com/COP4655-Group2/TrailGazer/assets/24413909/0fb68d0e-eff5-4562-9d63-110e0e9d9e63)




### Description

TrailGazer is a dynamic running app designed to allow users to capture stunning moments during their runs. The app's primary aim is to inspire users to venture outdoors, encouraging exploration of the scenic views they traverse while also working as a regular running app that tracks the distance and pace you run at.

### App Evaluation

- **Category:** Health & Fitness
- **Mobile:** Mobile Only
- **Story:**  TrailGaze helps in the journey of casual runners and walking enthusiasts as they explore the world around them and track their progress.
- **Market:** Casual runners & people who like to take long walks
- **Habit:** Daily or Weekly use
- **Scope:** Broad

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [x] User can create a new account
* [] User can login to account
* [] User can upload pictures
* [] User can check location of pictures on a map
* [] User can check distance traveled per day
* [] User can check exercise statistics per day

**Optional Nice-to-have Stories**

* [] User can persist user information across working sessions
* [] User can persist user log in credentials on multiple app launches
* [] User can change their app theme to dark mode
* [] User can put a profile picture
* [] User can check average exercising statistics
* [] User can customize personal goals
* [] User can add friends
* [] User can see friends' pictures
* [] User can like pictures

### 2. Screen Archetypes

- [ ] **Login Screen**
    * User can log in
- [ ] **Sign Up Screen**
    * User can create account
- [ ] **Home Screen**
    * User can start their exercising time
    * User can stop their exercising time
- [ ] **Profile Screen**
    * User can see their own profile
    * User can change settings
- [ ] **Map Screen**
    * User can see location of pictures they have taken
- [ ] **Gallery/Camera Screen**
    * User can upload pictures from gallery or camera
- [ ] **Statistics Screen**
    * User can see their daily exercise statistics
    * User can see past exercise statistics


### 3. Navigation

**Tab Navigation** (Tab to Screen)

- [ ] Home Tab
- [ ] Profile Tab
- [ ] Gallery Tab
- [ ] Statistics Tab
- [ ] Friends Tab

**Flow Navigation** (Screen to Screen)

- [ ] [**Login Screen**]
  * Leads to [**Sign Up Screen**]
  * Leads to [**Home Screen**]
- [ ] [**Tab Bar**]
  * Leads to [**Home Screen**] 
  * Leads to [**Profile Screen**] 
  * Leads to [**Gallery Screen**] 
  * Leads to [**Stats Screen**] 
  * Leads to [**Friends Screen**] 
- [ ] [**Gallery Screen**]
  * Leads to [**Gallery Detail Screen**] 
- [ ] [**Friends Screen**]
  * Leads to [**Friends Detail Screen**] 

## Wireframes
Files exceeded 1 MB limit, but here are links to our wireframes

https://ibb.co/DrvnRqj

### [BONUS] Digital Wireframes & Mockups

https://ibb.co/RBScTFd

### [BONUS] Interactive Prototype

## Schema 


### Models

[User]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| username | String | unique id for the user post (default field)   |
| password | String | user's password for login authentication      |
| email | String | user's email address      |
| totalRunTime | String | the total amount of time that a user has exercised for      |

[Picture]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| user | User | user who posted the picture    |
| imageFile | ParseFile | picture taken from app and stored in parse      |


### Networking

- [`[GET] /users` - to retrieve user data]
- [`[GET] /pictures` - to retrieve pictures posted]
- [`[POST] /pictures` - upload a newly taken picture]

