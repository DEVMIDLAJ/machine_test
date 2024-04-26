class Datum {
  int? id;
  String? subscriberId;
  String? lcoNo;
  String? mobile;
  String? countryCode;
  dynamic routeNo;
  String? customerType;
  String? areaName;
  String? status;
  String? currencyCode;
  String? joinDate;
  String? address;
  int? balance;
  int? connections;
  String? name;
  String? customerImage;

  Datum({
    this.id,
    this.subscriberId,
    this.lcoNo,
    this.mobile,
    this.countryCode,
    this.routeNo,
    this.customerType,
    this.areaName,
    this.status,
    this.currencyCode,
    this.joinDate,
    this.address,
    this.balance,
    this.connections,
    this.name,
    this.customerImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        subscriberId: json['subscriber_id'] as String?,
        lcoNo: json['lco_no'] as String?,
        mobile: json['mobile'] as String?,
        countryCode: json['country_code'] as String?,
        routeNo: json['route_no'] as dynamic,
        customerType: json['customer_type'] as String?,
        areaName: json['area_name'] as String?,
        status: json['status'] as String?,
        currencyCode: json['currency_code'] as String?,
        joinDate: json['join_date'] as String?,
        address: json['address'] as String?,
        balance: json['balance'] as int?,
        connections: json['connections'] as int?,
        name: json['name'] as String?,
        customerImage: json['customer_image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subscriber_id': subscriberId,
        'lco_no': lcoNo,
        'mobile': mobile,
        'country_code': countryCode,
        'route_no': routeNo,
        'customer_type': customerType,
        'area_name': areaName,
        'status': status,
        'currency_code': currencyCode,
        'join_date': joinDate,
        'address': address,
        'balance': balance,
        'connections': connections,
        'name': name,
        'customer_image': customerImage,
      };
}
