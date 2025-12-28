# JLPT N5 & N4 Quick Revision App

A simple, focused Flutter app for **last-minute JLPT N5 and N4 preparation**.

This app provides quick access to the best free online resources through organized links that open directly in the app.  
It includes **AI-generated mock tests** and **flashcards** (created using Google's Gemini) for effective practice — and **nothing extra**.

No ads, no unnecessary features — just what you need for fast revision before the exam.

## Features (Only the Essentials)

- **Curated Web Links**  
  Pre-loaded high-quality links to trusted free sites for grammar lists, explanations, practice quizzes, and full mock tests.

- **Built-in WebView**  
  Open any resource instantly inside the app — seamless and distraction-free.

- **AI-Generated Mock Tests** (via Gemini)  
  Realistic JLPT-style practice questions (grammar, vocabulary, reading) generated entirely by Google's Gemini AI.

- **AI-Generated Flashcards** (via Gemini)  
  Interactive flashcards covering essential N5 & N4 grammar points and vocabulary.  
  - Front: Japanese sentence or grammar pattern  
  - Back: Meaning, explanation, and example  
  Swipe to navigate, tap to flip — perfect for active recall.

- **Custom Folders & Links**  
  Add, edit, or delete your own links and folders to organize personal resources.

- **Fully Offline After First Launch**  
  All data stored locally with SQLite — works without internet.

## App Structure

### Home Screen
Choose from:
- N5 Grammar Revision → Web resources
- N5 Mock Tests → AI-generated mock questions + useful links
- N4 Grammar Revision → Web resources
- N4 Mock Tests → AI-generated mock questions + useful links
- N5 Flashcards → Gemini-generated flashcards
- N4 Flashcards → Gemini-generated flashcards

### Resource Pages
- Tap a category → View folders (e.g., "Key Resources", "Practice Tests")
- Tap folder → See list of links
- Tap link → Opens in full-screen WebView
- Add your own folders and links with the **+** button
- Swipe to delete, edit via menu

### Flashcard Pages
- Simple, clean flashcard interface
- Swipe left/right to go through cards
- Tap card to flip (show answer/explanation)
- Focused only on quick review — no complex tracking

### Mock Test Sections
- Access AI-generated practice questions
- Links to full online mock tests (official samples, japanesetest4you, etc.)

## Important Note

- **All mock test questions and flashcard content** are **generated using Google's Gemini AI** for high-quality, accurate practice.
- **I only added the web links** — the core practice content (mocks & flashcards) comes directly from Gemini.

## Installation

```bash
git clone https://github.com/yourusername/jlpt-n5-n4-revision-app.git
cd jlpt-n5-n4-revision-app
flutter pub get
flutter run
```

Works on Android and iOS.

## Why This App?

Built for one purpose: **help you pass JLPT N5 or N4 with focused, last-minute revision**.  
No bloat. No distractions. Just links, AI-powered mocks, and flashcards.

Made by a learner, for learners.

**Ganbatte kudasai! You've got this!** 🇯🇵✨
