import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.flim15-2.fna.fbcdn.net/v/t1.6435-9/84333707_1901981143280300_5086274531631300608_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeEKVs78cddCVpIs49Ny7aZr3zsqcm4qrunfOypybiqu6U_FLqBHHq8gtkI28JRNdO9DIFiPMLlDRSTz3zwN8Rkz&_nc_ohc=LbIrRCRNHQoAX8orsKH&_nc_ht=scontent.flim15-2.fna&oh=558dc7242c825ddcef5516c4def39bc7&oe=616BE4E4'),
              radius: 25.0,
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('OC'),
              ))
        ],
      ),
    );
  }
}
