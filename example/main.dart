// import 'package:latlong2/latlong.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_latlng;
// ignore: avoid_relative_lib_imports
import '../lib/geodesy.dart' show Geodesy;

void main() async {
  var geodesy = Geodesy();
  var l1 = google_maps_latlng.LatLng(50.06638889, 5.71472222);
  var l2 = google_maps_latlng.LatLng(58.64388889, 3.07000000);

  var distance = geodesy.distanceBetweenTwoGeoPoints(l1, l2);
  print('[distanceBetweenTwoGeoPoints] Distance: ' + distance.toString());

  var l3 = google_maps_latlng.LatLng(51.4778, -0.0015);
  var distinationPoint =
      geodesy.destinationPointByDistanceAndBearing(l3, 7794.0, 300.7);
  print('[destinationPointByDistanceAndBearing] Lat: ' +
      distinationPoint.latitude.toString());
  print('[destinationPointByDistanceAndBearing] Lng: ' +
      distinationPoint.longitude.toString());

  var l4 = google_maps_latlng.LatLng(52.205, 0.119);
  var l5 = google_maps_latlng.LatLng(48.857, 2.351);
  var bearing = geodesy.bearingBetweenTwoGeoPoints(l4, l5);
  print('[bearingBetweenTwoGeoPoints] Bearing: ' + bearing.toString());

  var finalBearing = geodesy.finalBearingBetweenTwoGeoPoints(l4, l5);
  print('[finalBearingBetweenTwoGeoPoints] Bearing:' + finalBearing.toString());

  var midpoint = geodesy.midPointBetweenTwoGeoPoints(l4, l5);
  print('[midPointBetweenTwoGeoPoints] Midpoint Lat: ' +
      midpoint.latitude.toString());
  print('[midPointBetweenTwoGeoPoints] Midpoint Lng: ' +
      midpoint.longitude.toString());

  var inBoudingBox = geodesy.isGeoPointInBoudingBox(l3, l5, l4);
  print('[isGeoPointInBoudingBox]: ' + inBoudingBox.toString());

  num b1 = 108.547;
  num b2 = 32.435;
  var intersectionByPaths = geodesy.intersectionByPaths(l4, l5, b1, b2);
  print(
      '[intersectionByPaths] Lat: ' + intersectionByPaths!.latitude.toString());
  print(
      '[intersectionByPaths] Lng: ' + intersectionByPaths.longitude.toString());

  var l6 = google_maps_latlng.LatLng(50.587, 1.231);
  var distanceToGreatCircle = geodesy.crossTrackDistanceTo(l4, l5, l6);
  print('[crossTrackDistanceTo] :' + distanceToGreatCircle.toString());

  var poly = <google_maps_latlng.LatLng>[
    google_maps_latlng.LatLng(1.0, 1.0),
    google_maps_latlng.LatLng(1.0, 2.0),
    google_maps_latlng.LatLng(2.0, 2.0),
    google_maps_latlng.LatLng(2.0, 1.0)
  ];
  var l7 = google_maps_latlng.LatLng(1.5, 1.5);
  var isGeoPointInPolygon = geodesy.isGeoPointInPolygon(l7, poly);
  print('[isGeoPointInPolygon] :' + isGeoPointInPolygon.toString());
}
