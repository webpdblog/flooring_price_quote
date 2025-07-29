import 'package:flutter/material.dart';

class PyeongCalculatorScreen extends StatefulWidget {
  const PyeongCalculatorScreen({super.key});

  @override
  State<PyeongCalculatorScreen> createState() => _PyeongCalculatorScreenState();
}

class _PyeongCalculatorScreenState extends State<PyeongCalculatorScreen> {
  final TextEditingController _sqmController = TextEditingController();
  final TextEditingController _pyeongController = TextEditingController();
  
  bool _isUpdatingSqm = false;
  bool _isUpdatingPyeong = false;

  final List<double> _presetAreas = [113, 101, 84, 74, 59, 49, 39, 33, 26, 19];

  void _convertSqmToPyeong(String value) {
    if (_isUpdatingPyeong) return;
    
    final double? sqm = double.tryParse(value);
    if (sqm != null && sqm > 0) {
      _isUpdatingSqm = true;
      final double pyeong = sqm / 3.305785;
      _pyeongController.text = pyeong.toStringAsFixed(2);
      _isUpdatingSqm = false;
    } else if (value.isEmpty) {
      _pyeongController.clear();
    }
  }

  void _convertPyeongToSqm(String value) {
    if (_isUpdatingSqm) return;
    
    final double? pyeong = double.tryParse(value);
    if (pyeong != null && pyeong > 0) {
      _isUpdatingPyeong = true;
      final double sqm = pyeong * 3.305785;
      _sqmController.text = sqm.toStringAsFixed(2);
      _isUpdatingPyeong = false;
    } else if (value.isEmpty) {
      _sqmController.clear();
    }
  }

  void _setPresetArea(double sqm) {
    _sqmController.text = sqm.toStringAsFixed(0);
    _convertSqmToPyeong(sqm.toStringAsFixed(0));
  }

  void _clearAll() {
    _sqmController.clear();
    _pyeongController.clear();
  }

  @override
  void dispose() {
    _sqmController.dispose();
    _pyeongController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('평수 계산기'),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      '면적 단위 변환',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _sqmController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: '제곱미터 (㎡)',
                              border: const OutlineInputBorder(),
                              suffixText: '㎡',
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            onChanged: _convertSqmToPyeong,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Icon(Icons.swap_horiz, size: 30, color: Colors.teal),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _pyeongController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: '평수',
                              border: const OutlineInputBorder(),
                              suffixText: '평',
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            onChanged: _convertPyeongToSqm,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _clearAll,
                      icon: const Icon(Icons.clear),
                      label: const Text('초기화'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              '자주 사용하는 면적',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _presetAreas.map((area) {
                return ElevatedButton(
                  onPressed: () => _setPresetArea(area),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[100],
                    foregroundColor: Colors.teal[700],
                    elevation: 2,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Text('${area.toInt()}㎡'),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 2,
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue[700]),
                        const SizedBox(width: 8),
                        Text(
                          '변환 공식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('• 1평 = 3.305785 ㎡'),
                    const Text('• 1㎡ = 0.3025 평'),
                    const Text('• 평수 = 제곱미터 ÷ 3.305785'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
