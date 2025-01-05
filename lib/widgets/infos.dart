import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/models/actor.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/utils/utils.dart';

class Infos extends StatelessWidget {
  const Infos({super.key, required this.actor});
  final Actor actor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              actor.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/Star.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    actor.popularity == 0.0
                        ? 'N/A'
                        : actor.popularity.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Color(0xFFFF8700),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_city,color:Colors.white),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    actor.placeOfBirth,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/calender.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    actor.birthday,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
