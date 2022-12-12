import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "Add Card",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const Image(
              image: AssetImage("assets/image.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Deep clean AC service (window)",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Image(
                  image: AssetImage("assets/Polygon.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Get 2x deeper dust removal with unique foam jet technologe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Image(
                  image: AssetImage("assets/Polygon.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Recommended for ACs serviced more than 6 months ago",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.black,
                  height: 40,
                  width: 40,
                  child: const Icon(
                    Icons.location_on,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Text(
                    "Kolapakkam - Tamil Nadu 600 489 India",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 40,
                  width: 40,
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 30,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "₹ 190.00",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Tax Rate 2% - ₹ 4.00 (- ₹ 195.00)",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                bottomSheet();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.white),
                height: 46,
                width: 340,
                child: const Center(
                    child: Text(
                  "Select Date Time",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  bottomSheet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(46),
          ),
        ),
        builder: (context) {
          return Container(
            height: 700,
          );
        });
  }
}
