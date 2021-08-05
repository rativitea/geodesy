import 'package:test/test.dart';
import 'package:geodesy/geodesy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps_latlng;


void main() {
  var geodesy = Geodesy();

  test('distanceBetweenTwoGeoPoints', () async {
    final l1 = google_maps_latlng.LatLng(50.06638889, 5.71472222);
    final l2 = google_maps_latlng.LatLng(58.64388889, 3.07000000);
    final distance = geodesy.distanceBetweenTwoGeoPoints(l1, l2);
    expect(distance, 968853.5466871752);
  });

  test('destinationPointByDistanceAndBearing', () async {
    final l3 = google_maps_latlng.LatLng(51.4778, -0.0015);
    final destinationPoint =
        geodesy.destinationPointByDistanceAndBearing(l3, 7794.0, 300.7);
    expect(destinationPoint, google_maps_latlng.LatLng(51.51354569174267, -0.0983453814483255));
  });

  test('bearingBetweenTwoGeoPoints', () async {
    final l4 = google_maps_latlng.LatLng(52.205, 0.119);
    final l5 = google_maps_latlng.LatLng(48.857, 2.351);
    final bearing = geodesy.bearingBetweenTwoGeoPoints(l4, l5);
    expect(bearing, 156.16658258153166);
  });

  test('bearingBetweenTwoGeoPoints', () async {
    final l4 = google_maps_latlng.LatLng(52.205, 0.119);
    final l5 = google_maps_latlng.LatLng(48.857, 2.351);
    final finalBearing = geodesy.finalBearingBetweenTwoGeoPoints(l4, l5);
    expect(finalBearing, 157.89044019049243);
  });

  test('midPointBetweenTwoGeoPoints', () async {
    final l4 = google_maps_latlng.LatLng(52.205, 0.119);
    final l5 = google_maps_latlng.LatLng(48.857, 2.351);
    final midpoint = geodesy.midPointBetweenTwoGeoPoints(l4, l5);
    expect(midpoint, google_maps_latlng.LatLng(50.53632687827432, 1.2746141006782636));
  });

  test('midPointBetweenTwoGeoPoints', () async {
    final l4 = google_maps_latlng.LatLng(52.205, 0.119);
    final l5 = google_maps_latlng.LatLng(48.857, 2.351);
    final midpoint = geodesy.midPointBetweenTwoGeoPoints(l4, l5);
    expect(midpoint, google_maps_latlng.LatLng(50.53632687827432, 1.2746141006782636));
  });

  test('isGeoPointInBoudingBox', () async {
    final l3 = google_maps_latlng.LatLng(51.4778, -0.0015);
    final l4 = google_maps_latlng.LatLng(52.205, 0.119);
    final l5 = google_maps_latlng.LatLng(48.857, 2.351);
    final inBoudingBox = geodesy.isGeoPointInBoudingBox(l3, l5, l4);
    expect(inBoudingBox, false);
  });

  test('intersectionByPaths', () async {
    final l4 = google_maps_latlng.LatLng(52.205, 0.119);
    final l5 = google_maps_latlng.LatLng(48.857, 2.351);
    final b1 = 108.547;
    final b2 = 32.435;
    final intersectionByPaths = geodesy.intersectionByPaths(l4, l5, b1, b2);
    expect(intersectionByPaths, google_maps_latlng.LatLng(51.15151144654275, 4.698604211862175));
  });

  test('crossTrackDistanceTo', () async {
    final l4 = google_maps_latlng.LatLng(52.205, 0.119);
    final l5 = google_maps_latlng.LatLng(48.857, 2.351);
    final l6 = google_maps_latlng.LatLng(50.587, 1.231);
    final distanceToGreatCircle = geodesy.crossTrackDistanceTo(l4, l5, l6);
    expect(distanceToGreatCircle, 1240.3379338876143);
  });

  test('crossTrackDistanceTo', () async {
    var poly = <google_maps_latlng.LatLng>[
      google_maps_latlng.LatLng(1.0, 1.0),
      google_maps_latlng.LatLng(1.0, 2.0),
      google_maps_latlng.LatLng(2.0, 2.0),
      google_maps_latlng.LatLng(2.0, 1.0)
    ];
    var l7 = google_maps_latlng.LatLng(1.5, 1.5);
    var isGeoPointInPolygon = geodesy.isGeoPointInPolygon(l7, poly);
    expect(isGeoPointInPolygon, true);
  });

  test('pointsInRange', () async {
    final point = google_maps_latlng.LatLng(51.0, 0);
    final distance = 10000;
    final pointNotInRange = geodesy.destinationPointByDistanceAndBearing(
        point, distance + 10, 420.0);
    final pointInRange = geodesy.destinationPointByDistanceAndBearing(
        point, distance - 10, 420.0);
    final pointsToCheck = <google_maps_latlng.LatLng>[pointInRange, pointNotInRange];
    final geofencedPoints =
        geodesy.pointsInRange(point, pointsToCheck, distance);
    expect((geofencedPoints.contains(pointInRange)), true);
    expect((geofencedPoints.contains(pointNotInRange)), false);
  });
}
