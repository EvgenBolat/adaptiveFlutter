import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LayoutBuilder Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder и адаптивный дизайн'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Информация об устройстве
              _buildDeviceInfoCard(context),
              const SizedBox(height: 20),

              // Пример 1: Сравнение LayoutBuilder и MediaQuery
              _buildLayoutBuilderExample(),
              const SizedBox(height: 30),

              // Пример 2: Адаптивная карточка продукта
              _buildAdaptiveCardExample(),
              const SizedBox(height: 30),

              // Пример 3: Макеты для разных устройств
              _buildDeviceLayoutsExample(),
            ],
          ),
        ),
      ),
    );
  }

  // Карточка с информацией об устройстве
  Widget _buildDeviceInfoCard(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Информация об устройстве:',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text('Ширина экрана: ${MediaQuery.of(context).size.width.toStringAsFixed(1)} px'),
            Text('Высота экрана: ${MediaQuery.of(context).size.height.toStringAsFixed(1)} px'),
            Text('Ориентация: ${MediaQuery.of(context).orientation.name}'),
            Text('Тип устройства: ${_getDeviceType(MediaQuery.of(context).size.shortestSide)}'),
          ],
        ),
      ),
    );
  }

  // Определение типа устройства на основе размера экрана
  String _getDeviceType(double shortestSide) {
    if (shortestSide < 600) {
      return 'Телефон';
    } else if (shortestSide < 900) {
      return 'Планшет';
    } else {
      return 'Десктоп';
    }
  }

  // Пример 1: Сравнение LayoutBuilder и MediaQuery
  Widget _buildLayoutBuilderExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Пример 1: LayoutBuilder vs MediaQuery',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
            'LayoutBuilder дает информацию о доступном пространстве внутри родительского виджета, '
                'в то время как MediaQuery - о размере всего экрана.'
        ),
        const SizedBox(height: 16),

        // Ограниченный контейнер для демонстрации LayoutBuilder
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const Text('Этот контейнер имеет ширину 300px:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                width: 300,
                height: 100,
                color: Colors.blue.shade100,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Center(
                      child: Text(
                        'LayoutBuilder: ${constraints.maxWidth.toStringAsFixed(1)} x ${constraints.maxHeight.toStringAsFixed(1)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Пример 2: Адаптивная карточка продукта
  Widget _buildAdaptiveCardExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Пример 2: Адаптивная карточка продукта',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
            'Эта карточка адаптируется к доступному пространству. '
                'Попробуйте повернуть устройство или изменить размер окна!'
        ),
        const SizedBox(height: 16),
        const AdaptiveProductCard(
          title: 'Умные часы Xiaomi Smart Watch S1',
          description: 'Умные часы с GPS, SpO2, мониторингом сна и автономностью до 12 дней. '
              'Водонепроницаемость 5 ATM, сапфировое стекло.',
          price: '12 999 ₽',
        ),
      ],
    );
  }

  // Пример 3: Макеты для разных устройств
  Widget _buildDeviceLayoutsExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Пример 3: Адаптация под разные устройства',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
            'В этом примере показаны разные макеты для телефона, планшета и десктопа. '
                'Попробуйте изменить размер окна или повернуть устройство!'
        ),
        const SizedBox(height: 16),
        const DeviceSpecificLayout(),
      ],
    );
  }
}

// Адаптивная карточка продукта
class AdaptiveProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const AdaptiveProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Используем горизонтальный макет для широких экранов и вертикальный для узких
          if (constraints.maxWidth > 450) {
            return _buildHorizontalLayout();
          } else {
            return _buildVerticalLayout();
          }
        },
      ),
    );
  }

  // Горизонтальный макет (для широких экранов)
  Widget _buildHorizontalLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Изображение продукта (заглушка)
        Container(
          width: 150,
          height: 180,
          color: Colors.grey.shade300,
          child: const Center(
            child: Icon(
              Icons.watch,
              size: 80,
              color: Colors.deepPurple,
            ),
          ),
        ),
        // Информация о продукте
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(description),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('В корзину'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Вертикальный макет (для узких экранов)
  Widget _buildVerticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Изображение продукта (заглушка)
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.grey.shade300,
          child: const Center(
            child: Icon(
              Icons.watch,
              size: 100,
              color: Colors.deepPurple,
            ),
          ),
        ),
        // Информация о продукте
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(description),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('В корзину'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Макет, адаптирующийся к разным типам устройств
class DeviceSpecificLayout extends StatelessWidget {
  const DeviceSpecificLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          // Десктоп макет (3 колонки)
          return _buildDesktopLayout();
        } else if (constraints.maxWidth >= 600) {
          // Планшет макет (2 колонки)
          return _buildTabletLayout();
        } else {
          // Мобильный макет (1 колонка)
          return _buildMobileLayout();
        }
      },
    );
  }

  // Мобильный макет (одна колонка)
  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.blue.shade100,
          width: double.infinity,
          child: const Column(
            children: [
              Icon(Icons.phone_android, size: 40),
              SizedBox(height: 8),
              Text(
                'Мобильный макет',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'На мобильных устройствах используем одноколоночный макет с вертикальной прокруткой.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildContentCard(
          'Элемент 1',
          'Описание элемента 1',
          Icons.description,
          Colors.blue,
        ),
        const SizedBox(height: 8),
        _buildContentCard(
          'Элемент 2',
          'Описание элемента 2',
          Icons.list,
          Colors.green,
        ),
        const SizedBox(height: 8),
        _buildContentCard(
          'Элемент 3',
          'Описание элемента 3',
          Icons.folder,
          Colors.orange,
        ),
      ],
    );
  }

  // Планшетный макет (две колонки)
  Widget _buildTabletLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.green.shade100,
          width: double.infinity,
          child: const Column(
            children: [
              Icon(Icons.tablet, size: 40),
              SizedBox(height: 8),
              Text(
                'Планшетный макет',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'На планшетах используем двухколоночный макет для эффективного использования пространства.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Первая колонка
            Expanded(
              child: Column(
                children: [
                  _buildContentCard(
                    'Элемент 1',
                    'Описание элемента 1 более подробное',
                    Icons.description,
                    Colors.blue,
                  ),
                  const SizedBox(height: 8),
                  _buildContentCard(
                    'Элемент 3',
                    'Описание элемента 3 более подробное',
                    Icons.folder,
                    Colors.orange,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Вторая колонка
            Expanded(
              child: Column(
                children: [
                  _buildContentCard(
                    'Элемент 2',
                    'Описание элемента 2 более подробное',
                    Icons.list,
                    Colors.green,
                  ),
                  const SizedBox(height: 8),
                  _buildContentCard(
                    'Элемент 4',
                    'Описание элемента 4 более подробное',
                    Icons.star,
                    Colors.purple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Десктопный макет (три колонки)
  Widget _buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.purple.shade100,
          width: double.infinity,
          child: const Column(
            children: [
              Icon(Icons.desktop_windows, size: 40),
              SizedBox(height: 8),
              Text(
                'Десктопный макет',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'На десктопах используем трехколоночный макет для максимально эффективного использования пространства экрана.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Первая колонка
            Expanded(
              child: Column(
                children: [
                  _buildContentCard(
                    'Элемент 1',
                    'Описание элемента 1',
                    Icons.description,
                    Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Вторая колонка
            Expanded(
              child: Column(
                children: [
                  _buildContentCard(
                    'Элемент 2',
                    'Описание элемента 2',
                    Icons.list,
                    Colors.green,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Третья колонка
            Expanded(
              child: Column(
                children: [
                  _buildContentCard(
                    'Элемент 3',
                    'Описание элемента 3',
                    Icons.folder,
                    Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Метод для создания карточки контента
  Widget _buildContentCard(String title, String description, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}
