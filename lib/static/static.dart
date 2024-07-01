import 'package:geolocator/geolocator.dart';

import '../const/market.dart';
import '../const/onboarding.models.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "onboardingtitle1",
      body: "onboardingBody1",
      image: " ImagesPath.onBoarding1"),
  OnBoardingModel(
      title: "onboardingtitle2",
      body: "onboardingBody2",
      image: "ImagesPath.onBoarding2"),
];

List market = [
  Market(
      id: '1',
      lat: 31.345692,
      long: 30.437645,
      title: 'Dr,Ali ahmed',
      image: 'assets/images/welco.png',
      description: 'Cardiothoracic department'),
  Market(
      id: '2',
      lat: 31.346952,
      long: 30.536145,
      title: 'Dr,Ali ahmed',
      image: 'assets/images/welco.png',
      description: 'Cardiothoracic department'),
  Market(
      id: '3',
      lat: 31.454192,
      long: 30.737145,
      title: 'Dr,Ali ahmed',
      image: 'assets/images/welco.png',
      description: 'Cardiothoracic department'),
];
List marketHospital = [
  Market(
      id: '1',
      lat: 31.345692,
      long: 30.437645,
      title: 'El_Nobaria',
      image: 'assets/images/welco.png',
      description: 'Cardiothoracic department'),
  Market(
      id: '2',
      lat: 31.346952,
      long: 30.536145,
      title: 'El_Nobaria',
      image: 'assets/images/welco.png',
      description: 'Cardiothoracic department'),
  Market(
      id: '3',
      lat: 31.454192,
      long: 30.737145,
      title: 'El_Nobaria',
      image: 'assets/images/welco.png',
      description: 'Cardiothoracic department'),
];

Position? positionGlobly;
