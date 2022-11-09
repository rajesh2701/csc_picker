library csc_picker;

import 'package:csc_picker/dropdown_with_search.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/select_status_model.dart';

enum Layout { vertical, horizontal }

enum CountryFlag { SHOW_IN_DROP_DOWN_ONLY, ENABLE, DISABLE }

enum DefaultCountry {
  Canada,
  France,
  Switzerland,
  Belgium,
  Germany,
  Afghanistan,
  Aland_Islands,
  Albania,
  Algeria,
  American_Samoa,
  Andorra,
  Angola,
  Anguilla,
  Antarctica,
  Antigua_And_Barbuda,
  Argentina,
  Armenia,
  Aruba,
  Australia,
  Austria,
  Azerbaijan,
  Bahamas_The,
  Bahrain,
  Bangladesh,
  Barbados,
  Belarus,
  Belize,
  Benin,
  Bermuda,
  Bhutan,
  Bolivia,
  Bosnia_and_Herzegovina,
  Botswana,
  Bouvet_Island,
  Brazil,
  British_Indian_Ocean_Territory,
  Brunei,
  Bulgaria,
  Burkina_Faso,
  Burundi,
  Cambodia,
  Cameroon,
  Cape_Verde,
  Cayman_Islands,
  Central_African_Republic,
  Chad,
  Chile,
  China,
  Christmas_Island,
  Cocos_Keeling_Islands,
  Colombia,
  Comoros,
  Congo,
  Congo_The_Democratic_Republic_Of_The,
  Cook_Islands,
  Costa_Rica,
  Cote_D_Ivoire_Ivory_Coast,
  Croatia_Hrvatska,
  Cuba,
  Cyprus,
  Czech_Republic,
  Denmark,
  Djibouti,
  Dominica,
  Dominican_Republic,
  East_Timor,
  Ecuador,
  Egypt,
  El_Salvador,
  Equatorial_Guinea,
  Eritrea,
  Estonia,
  Ethiopia,
  Falkland_Islands,
  Faroe_Islands,
  Fiji_Islands,
  Finland,
  French_Guiana,
  French_Polynesia,
  French_Southern_Territories,
  Gabon,
  Gambia_The,
  Georgia,
  Ghana,
  Gibraltar,
  Greece,
  Greenland,
  Grenada,
  Guadeloupe,
  Guam,
  Guatemala,
  Guernsey_and_Alderney,
  Guinea,
  Guinea_Bissau,
  Guyana,
  Haiti,
  Heard_Island_and_McDonald_Islands,
  Honduras,
  Hong_Kong_S_A_R,
  Hungary,
  Iceland,
  India,
  Indonesia,
  Iran,
  Iraq,
  Ireland,
  Israel,
  Italy,
  Jamaica,
  Japan,
  Jersey,
  Jordan,
  Kazakhstan,
  Kenya,
  Kiribati,
  Korea_North,
  Korea_South,
  Kuwait,
  Kyrgyzstan,
  Laos,
  Latvia,
  Lebanon,
  Lesotho,
  Liberia,
  Libya,
  Liechtenstein,
  Lithuania,
  Luxembourg,
  Macau_S_A_R,
  Macedonia,
  Madagascar,
  Malawi,
  Malaysia,
  Maldives,
  Mali,
  Malta,
  Man_Isle_of,
  Marshall_Islands,
  Martinique,
  Mauritania,
  Mauritius,
  Mayotte,
  Mexico,
  Micronesia,
  Moldova,
  Monaco,
  Mongolia,
  Montenegro,
  Montserrat,
  Morocco,
  Mozambique,
  Myanmar,
  Namibia,
  Nauru,
  Nepal,
  Bonaire_Sint_Eustatius_and_Saba,
  Netherlands_The,
  New_Caledonia,
  New_Zealand,
  Nicaragua,
  Niger,
  Nigeria,
  Niue,
  Norfolk_Island,
  Northern_Mariana_Islands,
  Norway,
  Oman,
  Pakistan,
  Palau,
  Palestinian_Territory_Occupied,
  Panama,
  Papua_new_Guinea,
  Paraguay,
  Peru,
  Philippines,
  Pitcairn_Island,
  Poland,
  Portugal,
  Puerto_Rico,
  Qatar,
  Reunion,
  Romania,
  Russia,
  Rwanda,
  Saint_Helena,
  Saint_Kitts_And_Nevis,
  Saint_Lucia,
  Saint_Pierre_and_Miquelon,
  Saint_Vincent_And_The_Grenadines,
  Saint_Barthelemy,
  Saint_Martin_French_part,
  Samoa,
  San_Marino,
  Sao_Tome_and_Principe,
  Saudi_Arabia,
  Senegal,
  Serbia,
  Seychelles,
  Sierra_Leone,
  Singapore,
  Slovakia,
  Slovenia,
  Solomon_Islands,
  Somalia,
  South_Africa,
  South_Georgia,
  South_Sudan,
  Spain,
  Sri_Lanka,
  Sudan,
  Suriname,
  Svalbard_And_Jan_Mayen_Islands,
  Swaziland,
  Sweden,
  Syria,
  Taiwan,
  Tajikistan,
  Tanzania,
  Thailand,
  Togo,
  Tokelau,
  Tonga,
  Trinidad_And_Tobago,
  Tunisia,
  Turkey,
  Turkmenistan,
  Turks_And_Caicos_Islands,
  Tuvalu,
  Uganda,
  Ukraine,
  United_Arab_Emirates,
  United_Kingdom,
  United_States,
  United_States_Minor_Outlying_Islands,
  Uruguay,
  Uzbekistan,
  Vanuatu,
  Vatican_City_State_Holy_See,
  Venezuela,
  Vietnam,
  Virgin_Islands_British,
  Virgin_Islands_US,
  Wallis_And_Futuna_Islands,
  Western_Sahara,
  Yemen,
  Zambia,
  Zimbabwe,
  Kosovo,
  Curacao,
  Sint_Maarten_Dutch_part
}

const Map<DefaultCountry, int> DefaultCountries = {
  DefaultCountry.Canada: 0,
  DefaultCountry.France: 1,
  DefaultCountry.Switzerland: 2,
  DefaultCountry.Belgium: 3,
  DefaultCountry.Germany: 4,
  DefaultCountry.Afghanistan: 5,
  DefaultCountry.Aland_Islands: 6,
  DefaultCountry.Albania: 7,
  DefaultCountry.Algeria: 8,
  DefaultCountry.American_Samoa: 9,
  DefaultCountry.Andorra: 10,
  DefaultCountry.Angola: 11,
  DefaultCountry.Anguilla: 12,
  DefaultCountry.Antarctica: 13,
  DefaultCountry.Antigua_And_Barbuda: 14,
  DefaultCountry.Argentina: 15,
  DefaultCountry.Armenia: 16,
  DefaultCountry.Aruba: 17,
  DefaultCountry.Australia: 18,
  DefaultCountry.Austria: 19,
  DefaultCountry.Azerbaijan: 20,
  DefaultCountry.Bahamas_The: 21,
  DefaultCountry.Bahrain: 22,
  DefaultCountry.Bangladesh: 23,
  DefaultCountry.Barbados: 24,
  DefaultCountry.Belarus: 25,
  DefaultCountry.Belize: 26,
  DefaultCountry.Benin: 27,
  DefaultCountry.Bermuda: 28,
  DefaultCountry.Bhutan: 29,
  DefaultCountry.Bolivia: 30,
  DefaultCountry.Bosnia_and_Herzegovina: 31,
  DefaultCountry.Botswana: 32,
  DefaultCountry.Bouvet_Island: 33,
  DefaultCountry.Brazil: 34,
  DefaultCountry.British_Indian_Ocean_Territory: 35,
  DefaultCountry.Brunei: 36,
  DefaultCountry.Bulgaria: 37,
  DefaultCountry.Burkina_Faso: 38,
  DefaultCountry.Burundi: 39,
  DefaultCountry.Cambodia: 40,
  DefaultCountry.Cameroon: 41,
  DefaultCountry.Cape_Verde: 42,
  DefaultCountry.Cayman_Islands: 43,
  DefaultCountry.Central_African_Republic: 44,
  DefaultCountry.Chad: 45,
  DefaultCountry.Chile: 46,
  DefaultCountry.China: 47,
  DefaultCountry.Christmas_Island: 48,
  DefaultCountry.Cocos_Keeling_Islands: 49,
  DefaultCountry.Colombia: 50,
  DefaultCountry.Comoros: 51,
  DefaultCountry.Congo: 52,
  DefaultCountry.Congo_The_Democratic_Republic_Of_The: 53,
  DefaultCountry.Cook_Islands: 54,
  DefaultCountry.Costa_Rica: 55,
  DefaultCountry.Cote_D_Ivoire_Ivory_Coast: 56,
  DefaultCountry.Croatia_Hrvatska: 57,
  DefaultCountry.Cuba: 58,
  DefaultCountry.Cyprus: 59,
  DefaultCountry.Czech_Republic: 60,
  DefaultCountry.Denmark: 61,
  DefaultCountry.Djibouti: 62,
  DefaultCountry.Dominica: 63,
  DefaultCountry.Dominican_Republic: 64,
  DefaultCountry.East_Timor: 65,
  DefaultCountry.Ecuador: 66,
  DefaultCountry.Egypt: 67,
  DefaultCountry.El_Salvador: 68,
  DefaultCountry.Equatorial_Guinea: 69,
  DefaultCountry.Eritrea: 70,
  DefaultCountry.Estonia: 71,
  DefaultCountry.Ethiopia: 72,
  DefaultCountry.Falkland_Islands: 73,
  DefaultCountry.Faroe_Islands: 74,
  DefaultCountry.Fiji_Islands: 75,
  DefaultCountry.Finland: 76,
  DefaultCountry.French_Guiana: 77,
  DefaultCountry.French_Polynesia: 78,
  DefaultCountry.French_Southern_Territories: 79,
  DefaultCountry.Gabon: 80,
  DefaultCountry.Gambia_The: 81,
  DefaultCountry.Georgia: 82,
  DefaultCountry.Ghana: 83,
  DefaultCountry.Gibraltar: 84,
  DefaultCountry.Greece: 85,
  DefaultCountry.Greenland: 86,
  DefaultCountry.Grenada: 87,
  DefaultCountry.Guadeloupe: 88,
  DefaultCountry.Guam: 89,
  DefaultCountry.Guatemala: 90,
  DefaultCountry.Guernsey_and_Alderney: 91,
  DefaultCountry.Guinea: 92,
  DefaultCountry.Guinea_Bissau: 93,
  DefaultCountry.Guyana: 94,
  DefaultCountry.Haiti: 95,
  DefaultCountry.Heard_Island_and_McDonald_Islands: 96,
  DefaultCountry.Honduras: 97,
  DefaultCountry.Hong_Kong_S_A_R: 98,
  DefaultCountry.Hungary: 99,
  DefaultCountry.Iceland: 100,
  DefaultCountry.India: 101,
  DefaultCountry.Indonesia: 102,
  DefaultCountry.Iran: 103,
  DefaultCountry.Iraq: 104,
  DefaultCountry.Ireland: 105,
  DefaultCountry.Israel: 106,
  DefaultCountry.Italy: 107,
  DefaultCountry.Jamaica: 108,
  DefaultCountry.Japan: 109,
  DefaultCountry.Jersey: 110,
  DefaultCountry.Jordan: 111,
  DefaultCountry.Kazakhstan: 112,
  DefaultCountry.Kenya: 113,
  DefaultCountry.Kiribati: 114,
  DefaultCountry.Korea_North: 115,
  DefaultCountry.Korea_South: 116,
  DefaultCountry.Kuwait: 117,
  DefaultCountry.Kyrgyzstan: 118,
  DefaultCountry.Laos: 119,
  DefaultCountry.Latvia: 120,
  DefaultCountry.Lebanon: 121,
  DefaultCountry.Lesotho: 122,
  DefaultCountry.Liberia: 123,
  DefaultCountry.Libya: 124,
  DefaultCountry.Liechtenstein: 125,
  DefaultCountry.Lithuania: 126,
  DefaultCountry.Luxembourg: 127,
  DefaultCountry.Macau_S_A_R: 128,
  DefaultCountry.Macedonia: 129,
  DefaultCountry.Madagascar: 130,
  DefaultCountry.Malawi: 131,
  DefaultCountry.Malaysia: 132,
  DefaultCountry.Maldives: 133,
  DefaultCountry.Mali: 134,
  DefaultCountry.Malta: 135,
  DefaultCountry.Man_Isle_of: 136,
  DefaultCountry.Marshall_Islands: 137,
  DefaultCountry.Martinique: 138,
  DefaultCountry.Mauritania: 139,
  DefaultCountry.Mauritius: 140,
  DefaultCountry.Mayotte: 141,
  DefaultCountry.Mexico: 142,
  DefaultCountry.Micronesia: 143,
  DefaultCountry.Moldova: 144,
  DefaultCountry.Monaco: 145,
  DefaultCountry.Mongolia: 146,
  DefaultCountry.Montenegro: 147,
  DefaultCountry.Montserrat: 148,
  DefaultCountry.Morocco: 149,
  DefaultCountry.Mozambique: 150,
  DefaultCountry.Myanmar: 151,
  DefaultCountry.Namibia: 152,
  DefaultCountry.Nauru: 153,
  DefaultCountry.Nepal: 154,
  DefaultCountry.Bonaire_Sint_Eustatius_and_Saba: 155,
  DefaultCountry.Netherlands_The: 156,
  DefaultCountry.New_Caledonia: 157,
  DefaultCountry.New_Zealand: 158,
  DefaultCountry.Nicaragua: 159,
  DefaultCountry.Niger: 160,
  DefaultCountry.Nigeria: 161,
  DefaultCountry.Niue: 162,
  DefaultCountry.Norfolk_Island: 163,
  DefaultCountry.Northern_Mariana_Islands: 164,
  DefaultCountry.Norway: 165,
  DefaultCountry.Oman: 166,
  DefaultCountry.Pakistan: 167,
  DefaultCountry.Palau: 168,
  DefaultCountry.Palestinian_Territory_Occupied: 169,
  DefaultCountry.Panama: 170,
  DefaultCountry.Papua_new_Guinea: 171,
  DefaultCountry.Paraguay: 172,
  DefaultCountry.Peru: 173,
  DefaultCountry.Philippines: 174,
  DefaultCountry.Pitcairn_Island: 175,
  DefaultCountry.Poland: 176,
  DefaultCountry.Portugal: 177,
  DefaultCountry.Puerto_Rico: 178,
  DefaultCountry.Qatar: 179,
  DefaultCountry.Reunion: 180,
  DefaultCountry.Romania: 181,
  DefaultCountry.Russia: 182,
  DefaultCountry.Rwanda: 183,
  DefaultCountry.Saint_Helena: 184,
  DefaultCountry.Saint_Kitts_And_Nevis: 185,
  DefaultCountry.Saint_Lucia: 186,
  DefaultCountry.Saint_Pierre_and_Miquelon: 187,
  DefaultCountry.Saint_Vincent_And_The_Grenadines: 188,
  DefaultCountry.Saint_Barthelemy: 189,
  DefaultCountry.Saint_Martin_French_part: 190,
  DefaultCountry.Samoa: 191,
  DefaultCountry.San_Marino: 192,
  DefaultCountry.Sao_Tome_and_Principe: 193,
  DefaultCountry.Saudi_Arabia: 194,
  DefaultCountry.Senegal: 195,
  DefaultCountry.Serbia: 196,
  DefaultCountry.Seychelles: 197,
  DefaultCountry.Sierra_Leone: 198,
  DefaultCountry.Singapore: 199,
  DefaultCountry.Slovakia: 200,
  DefaultCountry.Slovenia: 201,
  DefaultCountry.Solomon_Islands: 202,
  DefaultCountry.Somalia: 203,
  DefaultCountry.South_Africa: 204,
  DefaultCountry.South_Georgia: 205,
  DefaultCountry.South_Sudan: 206,
  DefaultCountry.Spain: 207,
  DefaultCountry.Sri_Lanka: 208,
  DefaultCountry.Sudan: 209,
  DefaultCountry.Suriname: 210,
  DefaultCountry.Svalbard_And_Jan_Mayen_Islands: 211,
  DefaultCountry.Swaziland: 212,
  DefaultCountry.Sweden: 213,
  DefaultCountry.Syria: 214,
  DefaultCountry.Taiwan: 215,
  DefaultCountry.Tajikistan: 216,
  DefaultCountry.Tanzania: 217,
  DefaultCountry.Thailand: 218,
  DefaultCountry.Togo: 219,
  DefaultCountry.Tokelau: 220,
  DefaultCountry.Tonga: 221,
  DefaultCountry.Trinidad_And_Tobago: 222,
  DefaultCountry.Tunisia: 223,
  DefaultCountry.Turkey: 224,
  DefaultCountry.Turkmenistan: 225,
  DefaultCountry.Turks_And_Caicos_Islands: 226,
  DefaultCountry.Tuvalu: 227,
  DefaultCountry.Uganda: 228,
  DefaultCountry.Ukraine: 229,
  DefaultCountry.United_Arab_Emirates: 230,
  DefaultCountry.United_Kingdom: 231,
  DefaultCountry.United_States: 232,
  DefaultCountry.United_States_Minor_Outlying_Islands: 233,
  DefaultCountry.Uruguay: 234,
  DefaultCountry.Uzbekistan: 235,
  DefaultCountry.Vanuatu: 236,
  DefaultCountry.Vatican_City_State_Holy_See: 237,
  DefaultCountry.Venezuela: 238,
  DefaultCountry.Vietnam: 239,
  DefaultCountry.Virgin_Islands_British: 240,
  DefaultCountry.Virgin_Islands_US: 241,
  DefaultCountry.Wallis_And_Futuna_Islands: 242,
  DefaultCountry.Western_Sahara: 243,
  DefaultCountry.Yemen: 244,
  DefaultCountry.Zambia: 245,
  DefaultCountry.Zimbabwe: 246,
  DefaultCountry.Kosovo: 247,
  DefaultCountry.Curacao: 248,
  DefaultCountry.Sint_Maarten_Dutch_part: 249,
};

class CSCPicker extends StatefulWidget {
  ///CSC Picker Constructor
  const CSCPicker({
    Key? key,
    this.onCountryChanged,
    this.onStateChanged,
    this.onCityChanged,
    this.selectedItemStyle,
    this.dropdownHeadingStyle,
    this.dropdownItemStyle,
    this.dropdownDecoration,
    this.disabledDropdownDecoration,
    this.searchBarRadius,
    this.dropdownDialogRadius,
    this.flagState = CountryFlag.ENABLE,
    this.layout = Layout.horizontal,
    this.showStates = true,
    this.showCities = true,
    this.defaultCountry,
    this.currentCountry,
    this.currentState,
    this.currentCity,
    this.disableCountry = false,
    this.countrySearchPlaceholder = "Search Country",
    this.stateSearchPlaceholder = "Search State",
    this.citySearchPlaceholder = "Search City",
    this.countryDropdownLabel = "Country",
    this.stateDropdownLabel = "State",
    this.cityDropdownLabel = "City",
  }) : super(key: key);

  final ValueChanged<String>? onCountryChanged;
  final ValueChanged<String?>? onStateChanged;
  final ValueChanged<String?>? onCityChanged;

  final String? currentCountry;
  final String? currentState;
  final String? currentCity;

  final bool disableCountry;

  ///Parameters to change style of CSC Picker
  final TextStyle? selectedItemStyle, dropdownHeadingStyle, dropdownItemStyle;
  final BoxDecoration? dropdownDecoration, disabledDropdownDecoration;
  final bool showStates, showCities;
  final CountryFlag flagState;
  final Layout layout;
  final double? searchBarRadius;
  final double? dropdownDialogRadius;

  final DefaultCountry? defaultCountry;

  final String countrySearchPlaceholder;
  final String stateSearchPlaceholder;
  final String citySearchPlaceholder;

  final String countryDropdownLabel;
  final String stateDropdownLabel;
  final String cityDropdownLabel;

  @override
  CSCPickerState createState() => CSCPickerState();
}

class CSCPickerState extends State<CSCPicker> {
  List<String?> _cities = [];
  List<String?> _country = [];
  List<String?> _states = [];

  String _selectedCity = 'City';
  String? _selectedCountry;
  String _selectedState = 'State';
  var responses;

  @override
  void initState() {
    super.initState();
    setDefaults();
    getCountries();
    _selectedCity = widget.cityDropdownLabel;
    _selectedState = widget.stateDropdownLabel;
  }

  Future<void> setDefaults() async {
    if (widget.currentCountry != null) {
      setState(() => _selectedCountry = widget.currentCountry);
      await getStates();
    }

    if (widget.currentState != null) {
      setState(() => _selectedState = widget.currentState!);
      await getCities();
    }

    if (widget.currentCity != null) {
      setState(() => _selectedCity = widget.currentCity!);
    }
  }

  void _setDefaultCountry() {
    if (widget.defaultCountry != null) {
      print(_country[DefaultCountries[widget.defaultCountry]!]);
      _onSelectedCountry(_country[DefaultCountries[widget.defaultCountry]!]!);
    }
  }

  ///Read JSON country data from assets
  Future<dynamic> getResponse() async {
    var res = await rootBundle
        .loadString('packages/csc_picker/lib/assets/country.json');
    return jsonDecode(res);
  }

  ///get countries from json response
  Future<List<String?>> getCountries() async {
    _country.clear();
    var countries = await getResponse() as List;
    countries.forEach((data) {
      var model = Country();
      model.name = data['name'];
      model.emoji = data['emoji'];
      if (!mounted) return;
      setState(() {
        widget.flagState == CountryFlag.ENABLE ||
                widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY
            ? _country.add(model.emoji! +
                "    " +
                model.name!) /* : _country.add(model.name)*/
            : _country.add(model.name);
      });
    });
    _setDefaultCountry();
    return _country;
  }

  ///get states from json response
  Future<List<String?>> getStates() async {
    _states.clear();
    //print(_selectedCountry);
    var response = await getResponse();
    var takeState = widget.flagState == CountryFlag.ENABLE ||
            widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY
        ? response
            .map((map) => Country.fromJson(map))
            .where(
                (item) => item.emoji + "    " + item.name == _selectedCountry)
            .map((item) => item.state)
            .toList()
        : response
            .map((map) => Country.fromJson(map))
            .where((item) => item.name == _selectedCountry)
            .map((item) => item.state)
            .toList();
    var states = takeState as List;
    states.forEach((f) {
      if (!mounted) return;
      setState(() {
        var name = f.map((item) => item.name).toList();
        for (var stateName in name) {
          //print(stateName.toString());
          _states.add(stateName.toString());
        }
      });
    });
    _states.sort((a, b) => a!.compareTo(b!));
    return _states;
  }

  ///get cities from json response
  Future<List<String?>> getCities() async {
    _cities.clear();
    var response = await getResponse();
    var takeCity = widget.flagState == CountryFlag.ENABLE ||
            widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY
        ? response
            .map((map) => Country.fromJson(map))
            .where(
                (item) => item.emoji + "    " + item.name == _selectedCountry)
            .map((item) => item.state)
            .toList()
        : response
            .map((map) => Country.fromJson(map))
            .where((item) => item.name == _selectedCountry)
            .map((item) => item.state)
            .toList();
    var cities = takeCity as List;
    cities.forEach((f) {
      var name = f.where((item) => item.name == _selectedState);
      var cityName = name.map((item) => item.city).toList();
      cityName.forEach((ci) {
        if (!mounted) return;
        setState(() {
          var citiesName = ci.map((item) => item.name).toList();
          for (var cityName in citiesName) {
            //print(cityName.toString());
            _cities.add(cityName.toString());
          }
        });
      });
    });
    _cities.sort((a, b) => a!.compareTo(b!));
    return _cities;
  }

  ///get methods to catch newly selected country state and city and populate state based on country, and city based on state
  void _onSelectedCountry(String value) {
    if (!mounted) return;
    setState(() {
      if (widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY) {
        try {
          this.widget.onCountryChanged!(value.substring(6).trim());
        } catch (e) {}
      } else
        this.widget.onCountryChanged!(value);
      //code added in if condition
      if (value != _selectedCountry) {
        _states.clear();
        _cities.clear();
        _selectedState = widget.stateDropdownLabel;
        _selectedCity = widget.cityDropdownLabel;
        this.widget.onStateChanged!(null);
        this.widget.onCityChanged!(null);
        _selectedCountry = value;
        getStates();
      } else {
        this.widget.onStateChanged!(_selectedState);
        this.widget.onCityChanged!(_selectedCity);
      }
    });
  }

  void _onSelectedState(String value) {
    if (!mounted) return;
    setState(() {
      this.widget.onStateChanged!(value);
      //code added in if condition
      if (value != _selectedState) {
        _cities.clear();
        _selectedCity = widget.cityDropdownLabel;
        this.widget.onCityChanged!(null);
        _selectedState = value;
        getCities();
      } else {
        this.widget.onCityChanged!(_selectedCity);
      }
    });
  }

  void _onSelectedCity(String value) {
    if (!mounted) return;
    setState(() {
      //code added in if condition
      if (value != _selectedCity) {
        _selectedCity = value;
        this.widget.onCityChanged!(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.layout == Layout.vertical
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  countryDropdown(),
                  SizedBox(
                    height: 10.0,
                  ),
                  stateDropdown(),
                  SizedBox(
                    height: 10.0,
                  ),
                  cityDropdown()
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: countryDropdown()),
                      widget.showStates
                          ? SizedBox(
                              width: 10.0,
                            )
                          : Container(),
                      widget.showStates
                          ? Expanded(child: stateDropdown())
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  widget.showStates && widget.showCities
                      ? cityDropdown()
                      : Container()
                ],
              ),
      ],
    );
  }

  ///filter Country Data according to user input
  Future<List<String?>> getCountryData(filter) async {
    var filteredList = _country
        .where(
            (country) => country!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty)
      return _country;
    else
      return filteredList;
  }

  ///filter Sate Data according to user input
  Future<List<String?>> getStateData(filter) async {
    var filteredList = _states
        .where((state) => state!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty)
      return _states;
    else
      return filteredList;
  }

  ///filter City Data according to user input
  Future<List<String?>> getCityData(filter) async {
    var filteredList = _cities
        .where((city) => city!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty)
      return _cities;
    else
      return filteredList;
  }

  ///Country Dropdown Widget
  Widget countryDropdown() {
    return DropdownWithSearch(
      title: widget.countryDropdownLabel,
      placeHolder: widget.countrySearchPlaceholder,
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      itemStyle: widget.dropdownItemStyle,
      decoration: widget.dropdownDecoration,
      disabledDecoration: widget.disabledDropdownDecoration,
      disabled: _country.length == 0 || widget.disableCountry ? true : false,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      label: widget.countrySearchPlaceholder,
      items: _country.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selected: _selectedCountry != null
          ? _selectedCountry
          : widget.countryDropdownLabel,
      //selected: _selectedCountry != null ? _selectedCountry : "Country",
      //onChanged: (value) => _onSelectedCountry(value),
      onChanged: (value) {
        print("countryChanged $value $_selectedCountry");
        if (value != null) {
          _onSelectedCountry(value);
        }
      },
    );
  }

  ///State Dropdown Widget
  Widget stateDropdown() {
    return DropdownWithSearch(
      title: widget.stateDropdownLabel,
      placeHolder: widget.stateSearchPlaceholder,
      disabled: _states.length == 0 ? true : false,
      items: _states.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      itemStyle: widget.dropdownItemStyle,
      decoration: widget.dropdownDecoration,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedState,
      label: widget.stateSearchPlaceholder,
      //onChanged: (value) => _onSelectedState(value),
      onChanged: (value) {
        //print("stateChanged $value $_selectedState");
        value != null
            ? _onSelectedState(value)
            : _onSelectedState(_selectedState);
      },
    );
  }

  ///City Dropdown Widget
  Widget cityDropdown() {
    return DropdownWithSearch(
      title: widget.cityDropdownLabel,
      placeHolder: widget.citySearchPlaceholder,
      disabled: _cities.length == 0 ? true : false,
      items: _cities.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      itemStyle: widget.dropdownItemStyle,
      decoration: widget.dropdownDecoration,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedCity,
      label: widget.citySearchPlaceholder,
      //onChanged: (value) => _onSelectedCity(value),
      onChanged: (value) {
        //print("cityChanged $value $_selectedCity");
        value != null ? _onSelectedCity(value) : _onSelectedCity(_selectedCity);
      },
    );
  }
}
