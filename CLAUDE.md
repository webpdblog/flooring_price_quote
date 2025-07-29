# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

이 프로젝트는 장판 가격 견적을 위한 Flutter 앱입니다. 주요 기능은 평수 계산기로, 미터 단위의 가로세로 길이를 입력받아 제곱미터와 평수로 변환해줍니다.

## Development Commands

### Build and Run
```bash
flutter run                    # 개발 모드로 실행
flutter build web             # 웹 빌드 (GitHub Pages 배포용)
flutter build apk             # Android APK 빌드
flutter build ios             # iOS 빌드
```

### Testing and Quality
```bash
flutter test                  # 단위 테스트 실행
flutter test test/widget_test.dart  # 특정 테스트 파일 실행
flutter analyze               # 코드 분석 (린트 포함)
```

### Dependencies
```bash
flutter pub get               # 의존성 패키지 설치
flutter pub upgrade           # 패키지 업그레이드
flutter pub outdated          # 오래된 패키지 확인
```

## Architecture and Structure

### Core Application Structure
- `lib/main.dart`: 앱 진입점과 메인 메뉴 화면 (HomeScreen)
- `lib/pyeong_calculator_screen.dart`: 평수 계산기 화면

### UI Components
- 메인 메뉴는 2개의 정사각형 버튼으로 구성 (1:1 비율)
- 첫 번째 버튼: "장판 평수" (아직 미구현)
- 두 번째 버튼: "평수 계산기" (구현됨)

### Calculation Logic
평수 계산 공식: `제곱미터 ÷ 3.305785 = 평`
- 가로 × 세로 = 제곱미터
- 제곱미터를 3.305785로 나누어 평수 계산

### Styling Conventions
- Material Design 사용
- 버튼 색상: 첫 번째 - `Colors.lightBlue[400]`, 두 번째 - `Colors.teal[400]`
- 둥근 모서리: `BorderRadius.circular(25)`
- 그림자 효과: `elevation: 8`

### State Management
- StatefulWidget을 사용한 로컬 상태 관리
- TextEditingController로 입력 필드 관리

## GitHub Pages Deployment

이 프로젝트는 GitHub Pages로 배포됩니다:
- `flutter build web` 명령으로 웹 빌드
- GitHub Actions를 통한 자동 배포
- `web/index.html`에서 base href 설정 확인 필요