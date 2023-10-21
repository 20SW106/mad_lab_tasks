import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';


class ConvertLatLngToAddress extends StatefulWidget {
  const ConvertLatLngToAddress({super.key});

  @override
  State<ConvertLatLngToAddress> createState() => _ConvertLatLngToAddressState();
}

class _ConvertLatLngToAddressState extends State<ConvertLatLngToAddress> {

  String stAddress = '', stAdd = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(stAddress),
          Text(stAdd),
          GestureDetector(
            onTap: () async {
              List<Location> locations = await locationFromAddress("Gronausestreat 710, Enchede");
              List<Placemark> placemark = await placemarkFromCoordinates(52.3456789, 6.98765432);
              // final coordinates = new Coordinates(33.6992, 72.9744);
              // var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
              // var first=address.first;

              // print("Address: "+first.featureName.toString()+first.addressLine.toString());

              setState(() {
                stAddress = locations.last.longitude.toString() + " " + locations.last.longitude.toString();
                stAdd = placemark.reversed.last.country.toString()+" "+placemark.reversed.last.locality.toString()+" "+placemark.reversed.last.subAdministrativeArea.toString();
              });

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: Center(
                  child: Text('Convert'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
