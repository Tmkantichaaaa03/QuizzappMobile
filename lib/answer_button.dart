import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final VoidCallback onPressed;

  const AnswerButton(this.answerText, {required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10), // เพิ่มระยะห่างระหว่างปุ่ม
        SizedBox(
          width: double.infinity, // ขยายปุ่มเต็มความกว้าง
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 58, 0, 97), // สีพื้นหลัง
              foregroundColor: Colors.white, // สีข้อความ
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // ขอบโค้งมน
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // ระยะห่างด้านใน
            ),
            child: Text(
              answerText, // ข้อความในปุ่ม
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
