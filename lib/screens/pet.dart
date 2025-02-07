import 'package:pet_app/constants.dart';
import 'package:pet_app/models/pet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PetScreen extends StatelessWidget {
  static String route = 'PetScreen';
  const PetScreen({Key? key}) : super(key: key);

  final TextStyle titleStyle = const TextStyle(
    fontFamily: 'Varela',
    fontSize: 32.0,
    color: kBlackCloralColor,
    fontWeight: FontWeight.w700,
  );

  final TextStyle subTitleStyle1 = const TextStyle(
    fontFamily: 'Varela',
    fontSize: 18.0,
    color: Colors.black38,
    fontWeight: FontWeight.w700,
  );
  final TextStyle subTitleStyle2 = const TextStyle(
    fontFamily: 'Varela',
    fontSize: 20.0,
    color: Colors.black87,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    final pet = ModalRoute.of(context)!.settings.arguments as Pet;
    return Scaffold(
      backgroundColor: kBoneColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    child: Image(
                      image: NetworkImage(pet.picture),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 25.0, right: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pet.name,
                                style: titleStyle,
                              ),
                              Icon(
                                pet.gender
                                    ? FontAwesomeIcons.mars
                                    : FontAwesomeIcons.venus,
                                color: pet.gender
                                    ? kBlackCloralColor
                                    : Colors.pink.shade200,
                                size: 28.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pet.breed,
                                style: subTitleStyle1,
                              ),
                              Text(
                                pet.age.toString() +
                                    (pet.age > 1 ? ' anos' : ' ano'),
                                style: subTitleStyle1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.locationDot,
                                color: kBlackCloralColor,
                              ),
                              Text(pet.location, style: subTitleStyle2),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Sobre esse animalzinho:',
                            style: subTitleStyle2,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                            child: SingleChildScrollView(
                              child: Text(
                                pet.about,
                                style: subTitleStyle1,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: kBlackCloralColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.solidHeart,
                                  size: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                child: Container(
                                    height: 55,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      color: kBlackCloralColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Adote aqui!',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontFamily: 'Varela',
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
