import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter House Rent',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HouseRent(),
    );
  }
}

class HouseRent extends StatelessWidget {
  const HouseRent({Key? key}) : super(key: key);

  static double height = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: const [
                BackgroundImage(),
                AppBarButtons(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CRAFTSMAN HOUSE',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: const Color(0xFF273746),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: height),
                  const Text(
                    '520 N Beaudry Ave, Los Angeles',
                    style: TextStyle(
                      color: Color(0xFF566573),
                    ),
                  ),
                  SizedBox(height: height),
                  const HouseInfo(),
                  SizedBox(height: height),
                  const UserInfo(),
                  SizedBox(height: height),
                  const ReadMoreText(
                    longText,
                    trimLines: 3,
                    colorClickableText: Colors.black,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Read less',
                    style: TextStyle(
                      color: Color(0xFF273746),
                      fontWeight: FontWeight.w500,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: height),
                  const Text(
                    'Gallery',
                    style: TextStyle(
                      color: Color(0xFF273746),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 10),
                      shrinkWrap: true,
                      itemCount: imageLists.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return HouseRentImageItem(imageUrl: imageLists[index]);
                      },
                    ),
                  ),
                  SizedBox(height: height),
                  const PriceBuyButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PriceBuyButton extends StatelessWidget {
  const PriceBuyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Price',
        style: TextStyle(color: Colors.grey),
      ),
      subtitle: Text(
        '\$5999090',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF273746),
            ),
      ),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          primary: const Color(0xFF273746),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: const Text('BUY NOW'),
      ),
    );
  }
}

class HouseRentImageItem extends StatelessWidget {
  final String imageUrl;

  const HouseRentImageItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 3),
            blurRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HouseInfo extends StatelessWidget {
  const HouseInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      softWrap: true,
      text: const TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.bed,
              size: 14,
              color: Colors.amber,
            ),
          ),
          TextSpan(
            text: '  4 Beds',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          WidgetSpan(
            child: Icon(
              Icons.bathtub,
              size: 14,
              color: Colors.amber,
            ),
          ),
          TextSpan(
            text: '  2 Baths',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          WidgetSpan(
            child: Icon(
              Icons.directions_car,
              size: 14,
              color: Colors.amber,
            ),
          ),
          TextSpan(
            text: '  1 Garage',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {},
      leading: const CircleAvatar(
        maxRadius: 30,
        backgroundImage: NetworkImage(personImage),
      ),
      title: Text(
        'Rebecca Tetha',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: const Color(0xFF273746).withOpacity(0.9),
            ),
      ),
      subtitle: const Text('Owner Craftman House'),
      trailing: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            primary: const Color(0xFF273746),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            )),
        icon: const Icon(
          Icons.call,
          size: 14,
        ),
        label: const Text('Call'),
      ),
    );
  }
}

class AppBarButtons extends StatelessWidget {
  const AppBarButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedButton(
              icon: Icons.arrow_back,
              onPress: () {},
            ),
            RoundedButton(
              icon: Icons.bookmark_border,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const RoundedButton({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Icon(
        icon,
        color: Colors.black,
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Image.asset(
        'assets/images/background_image.jpg',
        fit: BoxFit.cover,
        height: 400,
      ),
    );
  }
}
