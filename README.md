# cubit_login

A Flutter project which is created by Cubit/BLoC and Firebase.
The differ from the other bloc login projects, this project has social login instances and sign up properties, and while It does this, It uses freezed package which is very helpful for the state management. Also there are snackbars for the error handling, and login processes. For instance If you try to sign up with existing account, snackbar will give an error.
Additionally, thanks to flow_builder package, we can check via state, is user signed in or not, and with this, we can route the user. If you have already logged in, home page will start, but if you are not, then you will start sign in page.

Here you can reach the medium article of the project:

Part1: https://medium.com/@sahinefe/bloc-pattern-for-login-bloc-login-in-flutter-551fd05beb99

Part2: https://medium.com/@sahinefe/cubit-freezed-combination-to-manage-the-state-powerfully-in-flutter-2022-version-e64339e7c641

## Updates
 -->Cubits re-created with Freezed package.
 
 -->Exceptions, and snackbars have added.
 
 -->Re-password feature has added.

## Packages
  *flutter_bloc
  
  *freezed_annotation
  
  *flow_builder
  
  *formz
  
  *firebase_core
  
  *firebase_auth
  
  *cloud_firestore
  
## Mini Notes
If you want to use Apple sign in and Twitter sign in methods, you need to configure them from firestore. Twitter and Apple must give  developer permits to you.



## Gifs and Screenshots from the app
![sign up](https://user-images.githubusercontent.com/67283777/137185403-3dde3c7e-ee01-490c-9570-359a032a9830.gif)
![login](https://user-images.githubusercontent.com/67283777/137185419-1d9aa65a-4db7-4c8c-a852-97058bb7021c.gif)
![google](https://user-images.githubusercontent.com/67283777/137185425-a7ebee4e-e8ff-48bf-a2bc-001ba9f39ae8.gif)
![reset](https://user-images.githubusercontent.com/67283777/137185431-9731b9df-f295-48ee-b200-e2daaa0e0895.gif)

![link](https://user-images.githubusercontent.com/67283777/137185437-544c77d9-5736-4a15-af2e-1b3ec0dc2dd6.png)
![link2](https://user-images.githubusercontent.com/67283777/137185438-4bc33568-185a-470b-a035-2c9b54572dd0.png)
![link3](https://user-images.githubusercontent.com/67283777/137185439-e3339ab3-c987-4a5b-8307-7e6f6de08dd1.png)
