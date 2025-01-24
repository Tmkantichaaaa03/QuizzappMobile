import 'package:flutter/material.dart';
import 'questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // เพิ่มพื้นหลังแบบ Gradient ให้สวยงาม
          gradient: LinearGradient(
            colors: [Color(0xFF8E44AD), Color(0xFF5E3370)], // สีไล่เฉด
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ใช้ TweenAnimationBuilder เพื่อเพิ่มแอนิเมชันเฟดข้อความตอนโหลด
              TweenAnimationBuilder(
                duration: const Duration(seconds: 2), // ระยะเวลา 2 วินาที
                tween: Tween<double>(begin: 0, end: 1), // จากโปร่งใส -> ปรากฏ
                builder: (context, value, child) => Opacity(
                  opacity: value, // เปลี่ยนค่าความโปร่งใส
                  child: child,
                ),
                child: const Text(
                  'Welcome to Flutter Quiz!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20), // เพิ่มระยะห่าง

              // ปุ่ม "Start Quiz" ที่มีการตกแต่งใหม่
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuestionsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // พื้นหลังปุ่มเป็นสีขาว
                  foregroundColor: Colors.deepPurple, // ข้อความในปุ่มสีม่วง
                  padding: const EdgeInsets.symmetric(
                    vertical: 15, // ระยะห่างแนวตั้ง
                    horizontal: 50, // ระยะห่างแนวนอน
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // ขอบปุ่มโค้งมน
                  ),
                  elevation: 5, // เพิ่มเงาปุ่ม
                ),
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 18), // ขนาดตัวอักษรในปุ่ม
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
