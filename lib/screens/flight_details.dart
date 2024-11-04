import 'package:flutter/material.dart';

class FlightSearchDetails extends StatefulWidget {
  const FlightSearchDetails({super.key});

  @override
  State<FlightSearchDetails> createState() => _FlightSearchDetailsState();
}

class _FlightSearchDetailsState extends State<FlightSearchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 199, 88),
        title: const Text(
          "Ezy Travel",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTripInfo(),
            _buildDateSelector(),
            const SizedBox(height: 16),
            Expanded(child: _buildFlightList()),
          ],
        ),
      ),
    );
  }

  Widget _buildTripInfo() {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Column(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "BLR - Bengaluru to DXB - Dubai",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Departure: Sat, 23 Mar - Return: Sat, 23 Mar",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "(Round Trip)",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Modify Search",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  label: const Text(
                    'Sort',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                  iconAlignment: IconAlignment.end,
                ),
                TextButton(
                  onPressed: () {},
                  iconAlignment: IconAlignment.end,
                  child: const Text(
                    'Non - Stop',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                TextButton.icon(
                  label: const Text(
                    'Filter',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list, color: Colors.black),
                  iconAlignment: IconAlignment.end,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDateOption("Mar 22 - Mar 23", "From AED 741"),
        _buildDateOption("Mar 23 - Mar 24", "From AED 721", isSelected: true),
        _buildDateOption("Mar 24 - Mar 25", "From AED 750"),
      ],
    );
  }

  Widget _buildDateOption(String dateRange, String price,
      {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey[300]!,
        ),
      ),
      child: Column(
        children: [
          Text(dateRange,
              style: const TextStyle(fontSize: 12, color: Colors.black87)),
          Text(price,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildFlightList() {
    return ListView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildFlightCard();
      },
    );
  }

  Widget _buildFlightCard() {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      elevation: 6, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
      child: Padding(
        padding:
            const EdgeInsets.all(12), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFlightInfo("Onward - Garuda Indonesia", "14:35",
                "BLR - Bengaluru", "21:55", "DXB - Dubai", "AED 409"),
            const Divider(thickness: 1),
            _buildFlightInfo("Return - Garuda Indonesia", "21:55",
                "DXB - Dubai", "14:35", "BLR - Bengaluru", "AED 359"),
            const Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildBadge("Cheapest", Colors.green),
                    const SizedBox(width: 8),
                    _buildBadge("Refundable", Colors.blue),
                  ],
                ),
                TextButton.icon(
                  onPressed: null,
                  label: const Text(
                    'Flight Details',
                    style: TextStyle(color: Colors.orange, fontSize: 10),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconAlignment: IconAlignment.end,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightInfo(String type, String startTime, String startLocation,
      String endTime, String endLocation, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.airplanemode_active,
                  color: Colors.white, size: 16),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(type,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.normal)),
            ),
            Text(price,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(startTime,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(startLocation, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.flight_takeoff, color: Colors.green),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(endTime,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(endLocation, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10),
      ),
    );
  }
}
