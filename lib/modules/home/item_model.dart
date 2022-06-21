import 'package:flutter/material.dart';

class ItemModel {
  // Dados Pessoais
  bool expanded;
  bool expanded2;
  String headerPanel;
  String email;
  String emailPersonTitle;
  String city;
  String cityPersonTitle;
  String district;
  String districtPersonTitle;
  String homeAddress;
  String address;
  String addresPersonTitle;
  Color colorsItem;

  // Dados Empresariais
  String businessEmailTitle;
  String businessEmail;
  String immediateLeaderTitle;
  String immediateLeader;
  String companyTitle;
  String company;
  String informedAreaTitle;
  String informedArea;
  String informedSectorTitle;
  String informedSector;
  String informedSectionTitle;
  String informedSection;

  ItemModel({
    this.expanded = true,
    this.expanded2 = false,
    required this.headerPanel,
    required this.email,
    required this.emailPersonTitle,
    required this.city,
    required this.cityPersonTitle,
    required this.district,
    required this.districtPersonTitle,
    required this.homeAddress,
    required this.address,
    required this.addresPersonTitle,
    required this.colorsItem,
    required this.businessEmailTitle,
    required this.businessEmail,
    required this.immediateLeaderTitle,
    required this.immediateLeader,
    required this.companyTitle,
    required this.company,
    required this.informedAreaTitle,
    required this.informedArea,
    required this.informedSectorTitle,
    required this.informedSector,
    required this.informedSectionTitle,
    required this.informedSection,
  });
}
