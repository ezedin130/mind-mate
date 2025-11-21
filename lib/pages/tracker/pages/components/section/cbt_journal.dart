import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CbtJournal extends StatelessWidget {
  const CbtJournal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CBT Thought Journal",
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Explore your thoughts and emotions through guided reflection",
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.grey[300]),
            ],
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Situation Section
              _buildJournalSection(
                title: "What's the situation?",
                hint: "Describe what happened or what's on your mind...",
                maxLines: 3,
              ),
              const SizedBox(height: 32),
              _buildThoughtsSection(),
              const SizedBox(height: 32),
              _buildEmotionsSection(),
              const SizedBox(height: 32),
              _buildPhysicalSensationsSection(),
              const SizedBox(height: 32),
              _buildResponseSection(),
              const SizedBox(height: 40),
              _buildSaveButton(),
              const SizedBox(height: 20),
              _buildReflectionTip(),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildJournalSection({
    required String title,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.lato(
                color: Colors.grey[500],
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
//cbt journal
  Widget _buildThoughtsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Thoughts & Beliefs",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "What thoughts are going through your mind?",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "What are you thinking? What beliefs come up?",
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Describe your thoughts and beliefs...",
                  hintStyle: GoogleFonts.lato(
                    color: Colors.grey[500],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
//cbt journal
  Widget _buildEmotionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What emotions are you experiencing?",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: "e.g., anxious, sad, frustrated, overwhelm",
            hintStyle: GoogleFonts.lato(
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Emotion Intensity: 5/10",
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIntensityButton("Mild"),
            _buildIntensityButton("Moderate"),
            _buildIntensityButton("Intense"),
          ],
        ),
      ],
    );
  }
//cbt journal
  Widget _buildIntensityButton(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.grey[50],
          foregroundColor: Colors.black87,
          side: BorderSide(color: Colors.grey[400]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
//cbt journal
  Widget _buildPhysicalSensationsSection() {
    return _buildJournalSection(
      title: "Physical sensations in your body?",
      hint: "e.g., tight chest, tense shoulders, racing heart",
      maxLines: 2,
    );
  }
//cbt journal
  Widget _buildResponseSection() {
    return _buildJournalSection(
      title: "How did you respond or want to respond?",
      hint: "What did you do or feel like doing?",
      maxLines: 3,
    );
  }
//cbt journal
  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E4957),
          foregroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          "Save Journal Entry",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
//cbt journal
  Widget _buildReflectionTip() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F4F8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFB8E1EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: const Color(0xFF1E4957),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                "Reflection Tip",
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E4957),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Notice patterns in your thoughts without judgment. Are there thinking traps like catastrophizing, all-or-nothing thinking, or mind reading? Identifying these patterns is the first step to challenging them.",
            style: GoogleFonts.lato(
              fontSize: 14,
              color: const Color(0xFF1E4957),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
