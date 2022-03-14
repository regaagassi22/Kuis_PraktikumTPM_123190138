import 'package:flutter/material.dart';
import 'package:kuistpm_rega/detail_page.dart';
import 'model/Hype.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant Andeskuy"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30.0),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _createListCard(),
      ),
    );
  }

  Widget _createListCard() {
    var dataMenu = getAllMenu();

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataMenu[index], context);
      },
      itemCount: dataMenu.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  // Widget _createGridCard() {
  //   return GridView.builder(
  //     gridDelegate:
  //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  //     itemBuilder: (context, index){
  //       return _createCard();
  //     },
  //     itemCount: 20,
  //   );
  // }

  Widget _createCard(Menu data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(name: data.name, image: data.image,desc: data.desc, price: data.price, category: data.category, ratings: data.ratings, reviewer: data.reviewer, sold: data.sold);
          }));
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(data.image),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(data.name)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
