import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel/screens/flight_details.dart';

class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage({super.key});

  @override
  State<FlightSearchPage> createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 199, 88),
        elevation: 0,
        title: const Text(
          "Search Flights",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.black))
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            // Stack(
            //   alignment: Alignment.bottomCenter, // Aligns the TripTypeSelector to the bottom
            //   children: [
            //     HeaderSection(),
            //     Positioned(
            //       bottom: 0, // Positions the TripTypeSelector at the bottom of the HeaderSection
            //       child: TripTypeSelector(),
            //     ),
            //   ],
            // ),
            TripTypeSelector(),
            FlightSearchForm(),
            SearchButton(),
            TravelInspirationsSection(),
            FlightAndHotelPackagesSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: AssetImage('assets/poster.jfif'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.topLeft,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          "Let's start your trip",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TripTypeSelector extends StatelessWidget {
  const TripTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TripTypeButton(label: "Round Trip", selected: false),
        TripTypeButton(label: "One Way", selected: true),
        TripTypeButton(label: "Multi-city", selected: false),
      ],
    );
  }
}

class TripTypeButton extends StatelessWidget {
  final String label;
  final bool selected;

  const TripTypeButton(
      {required this.label, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Colors.green : Colors.white,
        foregroundColor: selected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 5.0,
        // padding: const EdgeInsets.symmetric(
        //     vertical: 8, horizontal: 12),
        minimumSize: const Size(110, 30),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}

class FlightSearchForm extends StatelessWidget {
  const FlightSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    final departure = TextEditingController();
    final ret = TextEditingController();
    final travellers = TextEditingController();
    final cabin = TextEditingController();
    final from = TextEditingController();
    final to = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildForm(
                            from,
                            null,
                            'From',
                            null,
                            null,
                            false,
                            TextInputType.text,
                            false,
                            const Icon(Icons.flight)),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.green,
                                  Colors.green.withOpacity(0.0),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                          ),
                        ),
                        _buildForm(
                            to,
                            null,
                            'To',
                            null,
                            null,
                            false,
                            TextInputType.text,
                            false,
                            const Icon(Icons.location_pin)),
                      ],
                    ),
                  ),
                  IconButton(
                    splashRadius: 10,
                    onPressed: null,
                    icon: Icon(
                      Icons.shuffle,
                      color: Colors.green[400],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildDateFormUI(departure, 'Departure', null,
                    () => datePicker(departure, context), true),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildDateFormUI(
                    ret, 'Return', null, () => datePicker(ret, context), true),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildFormUI(travellers, 'Travellers', null, null, null,
                    false, TextInputType.text, false, null),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildFormUI(cabin, 'Cabin Class', null, null, null,
                    false, TextInputType.text, false, null),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateFormUI(
    TextEditingController? formController,
    String? labelText,
    String? hintText,
    Function()? onTap,
    final bool boolValue,
  ) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
        readOnly: boolValue,
        controller: formController,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          labelText: labelText,
          hintText: hintText,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          filled: true,
          suffixIcon: const Icon(
            Icons.calendar_month,
            size: 20.0,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Future<void> datePicker(
      TextEditingController con, BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100), 
    );

    if (pickedDate != null) {
      con.text =
          DateFormat('dd-MM-yyyy').format(pickedDate); 
    }
  }

  Widget _buildFormUI(
    final TextEditingController? formController,
    final String? labelText,
    final String? hintText,
    final Function()? onTap,
    final String? Function(String?)? validate,
    final bool boolValue,
    final TextInputType keyboardType,
    final bool showDropDownIcon,
    final Icon? prefixIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: boolValue,
        controller: formController,
        cursorColor: Colors.red,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          labelText: labelText,
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          prefixIcon: prefixIcon,
          suffixIcon: showDropDownIcon
              ? const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 25.0,
                )
              : null,
        ),
        onTap: onTap,
        validator: validate,
      ),
    );
  }

  Widget _buildForm(
    final TextEditingController? formController,
    final String? labelText,
    final String? hintText,
    final Function()? onTap,
    final String? Function(String?)? validate,
    final bool boolValue,
    final TextInputType keyboardType,
    final bool showDropDownIcon,
    final Icon? prefixIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: boolValue,
        controller: formController,
        cursorColor: Colors.red,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.grey),
          labelText: labelText,
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 12), 
          prefixIcon: prefixIcon,
          suffixIcon: showDropDownIcon
              ? const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 25.0,
                )
              : null,
        ),
        onTap: onTap,
        validator: validate,
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[600],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            minimumSize: const Size(110, 30)),
        child: const Text("Search Flights",
            style: TextStyle(fontSize: 12, color: Colors.white)),
      ),
    );
  }
}

class TravelInspirationsSection extends StatelessWidget {
  const TravelInspirationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Travel Inspirations",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  label: const Text(
                    'Dubai',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                  iconAlignment: IconAlignment.end,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                )
              ],
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TravelCard(
                  imagePath:
                      'assets/saudi.webp',
                  flightNo: 'From AED867',
                  country: "Saudi Arabia",
                  type: "Economy Round Trip",
                ),
                TravelCard(
                  imagePath:
                      'assets/kuwait.jfif',
                  flightNo: 'From AED868',
                  country: "Kuwait",
                  type: "Economy Rounf Trip",
                ),
                TravelCard(
                  imagePath:
                      'assets/uae.webp',
                  flightNo: 'From AED869',
                  country: "UAE",
                  type: "Economy Round Trip",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TravelCard extends StatefulWidget {
  final String country;
  final String type;
  final String flightNo;
  final String? imagePath;

  const TravelCard({
    required this.country,
    required this.type,
    required this.flightNo,
    super.key,
    required this.imagePath,
  });

  @override
  State<TravelCard> createState() => _TravelCardState();
}

class _TravelCardState extends State<TravelCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FlightSearchDetails(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          width: 120,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(widget.imagePath!),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 10.0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${widget.flightNo}\n",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 9,
                  ),
                ),
                TextSpan(
                  text: "${widget.type}\n",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 9,
                  ),
                ),
                TextSpan(
                  text: "${widget.country}\n",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FlightAndHotelPackagesSection extends StatelessWidget {
  const FlightAndHotelPackagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Flight & Hotel Packages",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/advertisement.webp'), 
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(8),
            ),
          ],
        ),
      ),
    );
  }
}
