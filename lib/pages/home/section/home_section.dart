import 'package:flutter/material.dart';
import 'package:mindmate/pages/activity/suggested_activity_page.dart';
import 'package:mindmate/pages/resource/suggested_resource_page.dart';
import 'package:mindmate/util/custom_text_field.dart';
import '../../../util/reusable_container.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(hint: "search...", obscure: false,color: Colors.lightBlueAccent,),
              const SizedBox(height: 10.0,),
              ReUsableContainer(
                image: 'lib/assets/exercise.png',
                title: 'Suggested Exercise',
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SuggestedActivityPage()
                      ),
                  );
                },
              ),
              const SizedBox(height: 10.0,),
              ReUsableContainer(
                image: 'lib/assets/resource.png',
                title: 'Suggested resource',
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SuggestedResourcePage()
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
