import 'package:flutter/material.dart';

import 'food_anh.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedButton = 'Phở';  // Mặc định chọn Phở khi khởi chạy

  @override
  Widget build(BuildContext context) {
    // Lọc món ăn dựa trên nút được chọn
    Map<String, dynamic>? selectedFoodItem = foodItems.firstWhere(
            (item) => item['mon'] == selectedButton,
        orElse: () => {});

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Danh sách nút cho các loại món ăn
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: foodItems.map((item) {
                  return Row(
                    children: [
                      nut(item['mon']),
                      SizedBox(width: 15),
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Danh sách món ăn:',
              style: TextStyle(fontSize: 20),
            ),
            // Hiển thị các món ăn dựa trên lựa chọn
            Expanded(
              child: selectedFoodItem != null
                  ? ListView.builder(
                itemCount: selectedFoodItem['anh'].length,
                itemBuilder: (context, index) {
                  return foodCard(selectedFoodItem, index);
                },
              )
                  : Center(child: Text('Không có món ăn nào!')),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo widget hiển thị thông tin món ăn
  Widget foodCard(Map<String, dynamic> foodItem, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(foodItem['anh'][index], height: 220,width: 400, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(
            foodItem['loai'][index],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            foodItem['gia'][index],
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Hàm tạo widget nút cho từng món ăn
  Widget nut(String title) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButton = title;  // Cập nhật nút đã chọn
        });
      },
      child: Text(title),
      style: ElevatedButton.styleFrom(
        backgroundColor:
        selectedButton == title ? Colors.yellow[700] : Colors.white,
        foregroundColor:
        selectedButton == title ? Colors.white : Colors.yellow[700],
        minimumSize: Size(120, 45), // Đặt kích thước tối thiểu cho nút
        padding: EdgeInsets.symmetric(vertical: 10), // Đặt padding
        side: BorderSide(
          width: 2, // Độ dày viền
          color: Colors.yellow[700]!,
        ),
      ),
    );
  }
}
