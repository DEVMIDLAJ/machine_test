import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machin_test/model/customer_model.dart';

class ApiServices {
  // Function to fetch customer data from the API
  Future<CustomerModel> fetchCustomers() async {
    // Making an HTTP GET request to the API endpoint
    final response = await http.get(Uri.parse(
        "https://customer.billerq.com/public/api/mobile/get-customer-details?page_length=10&page=2"));
    
    // Parsing the response body as JSON
    var data = jsonDecode(response.body.toString());
    
    // Checking if the response status code is 200 
    if (response.statusCode == 200) {
      // If successful, return the parsed JSON data as a CustomerModel object
      return CustomerModel.fromJson(data);
    } else {
      // If unsuccessful, still return the parsed JSON data as a CustomerModel object
      // This can be useful for handling errors in the calling code
      return CustomerModel.fromJson(data);
    }
  }
}
