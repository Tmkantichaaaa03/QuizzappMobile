import 'package:flutter/material.dart';
import 'package:myapp/model/quiz_model.dart';
import 'answer_button.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ใช้ QuizModel สำหรับเก็บคำถามและคำตอบ
    final QuizModel quiz = QuizModel(
      'What are the main building blocks of Flutter UIs?', // ข้อความคำถาม
      ['Widgets', 'Components', 'Blocks', 'Functions'], // ตัวเลือกคำตอบ
    );

    // สุ่มเรียงคำตอบใหม่
    final List<String> shuffledAnswers = quiz.getShuffluedAnswer();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // เพิ่มพื้นหลังแบบ Gradient ให้เหมือนหน้า StartScreen
          gradient: LinearGradient(
            colors: [Color(0xFF8E44AD), Color(0xFF5E3370)], // สีไล่เฉด
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            // ใช้ SingleChildScrollView เผื่อเนื้อหายาวเกินจอ
            child: Container(
              margin: const EdgeInsets.all(40), // เพิ่มระยะห่างรอบคำถาม
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ข้อความคำถาม
                  Text(
                    quiz.question, // ดึงคำถามจาก QuizModel
                    style: const TextStyle(
                      color: Colors.white, // สีข้อความ
                      fontSize: 24, // ขนาดตัวอักษรใหญ่
                      fontWeight: FontWeight.bold, // ตัวหนา
                    ),
                    textAlign: TextAlign.center, // จัดข้อความให้อยู่กลาง
                  ),
                  const SizedBox(height: 30), // เพิ่มระยะห่างระหว่างคำถามและตัวเลือก

                  // สร้างปุ่มคำตอบจากรายการคำตอบที่สุ่มเรียงใหม่
                  ...shuffledAnswers.map(
                    (answer) => AnswerButton(
                      answer, // ส่งคำตอบแต่ละตัวไปที่ AnswerButton
                      onPressed: () {
                        // แสดง Dialog เมื่อผู้ใช้กดเลือกคำตอบ
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text('You selected: $answer'), // แสดงคำตอบที่เลือก
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // ปิด Dialog
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
