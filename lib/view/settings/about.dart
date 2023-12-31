import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ABOUT"),
        backgroundColor: const Color.fromARGB(255, 1, 56, 86),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(15),
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                padding: const EdgeInsets.all(20),
                
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Our App",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),textAlign: TextAlign.center,),
                    SizedBox(height: 15,),
                    Text("Welcome to COSNOVIX, your go-to solution for managing your finances seamlessly. Our app is designed to simplify the tracking of your income and expenses, empowering you to make informed financial decisions with ease.",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 15,),
                    Text("Key Features:",
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(height: 15,),
                    Text("1. Expense Tracking:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 15,),
                    Text("Effortlessly monitor your expenses by categorizing them, helping you understand where your money is going. Stay in control of your budget and identify areas for potential savings.",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 15,),
                    Text("2. Income Management:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 15,),
                    Text("Keep track of your various sources of income, ensuring a comprehensive overview of your financial inflows. Our intuitive interface makes it easy to log and analyze your earnings.",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 15,),
                    Text("3. Detailed Insights:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 15,),
                    Text("Gain valuable insights into your spending patterns and financial habits. Visualize your data through clear charts and graphs, allowing you to make informed decisions for a secure financial future.",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 15,),
                    Text("4. Secure and Private:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 15,),
                    Text("Rest assured that your financial data is secure. We prioritize the privacy and confidentiality of your information, utilizing advanced security measures to keep your data safe.",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 15,),
                    Text("Contact Us:",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w800),textAlign: TextAlign.center,),
                    SizedBox(height: 15,),
                    Text("Have questions or feedback? We'd love to hear from you!",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 25,),
                    Text("Email: info@cosnovix.com",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 15,),
                    Text("Customer Support: www.cosnovix.com",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 30,),
                    Text("Thank you for choosing COSNOVIX to guide you on your financial journey. We're committed to helping you achieve financial success and stability.",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 30,),
                    Text("Happy budgeting!",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(height: 30,),
                    Text("COSNOVIX Team",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}