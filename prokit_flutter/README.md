# prokit_flutter

# List of Video Tutorials

- Download and configuring Flutter and building the ProKit Flutter - https://youtu.be/QNlfN32G5As
- How to build ProKit Flutter in Android - https://youtu.be/QKMfASEX9As
- How to build ProKit Flutter in iOS - https://youtu.be/Hg9S6AKzWxE
- How to extract Theme or Full App from ProKit Flutter - https://youtu.be/qLBIhQyUW3w

Note:
- Importing mobx is a must as Mobx is used for changing colors in the entire app (eg. Dark Mode to Light Mode and vice versa).
- Importing nb_utils is a must as nb_utils is the package that is often used in the prokit as it has many common widgets. hence it saves our time.
- Copy the store folder from the main directory and paste it in the new project.
- Copy this files "AppColor","AppTheme","AppWidgets","AppConstants". from utils folder located at (lib - main - utils-  files).
- We have used localizationsDelegates in muvi app for Multi-Language support so we will delete the localizationsDelegates from the main. dart file as we don't need in the example video. (do not delete when copying muvi app.)