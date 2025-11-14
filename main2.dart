import 'package:flutter/material.dart' show AppBar, AppBarTheme, BorderRadius, BorderSide, BoxDecoration, BoxFit, BoxShadow, BuildContext, Card, CardTheme, Center, ClipRRect, Color, Colors, Column, Container, CrossAxisAlignment, DropdownButtonFormField, DropdownMenuItem, EdgeInsets, ElevatedButton, ElevatedButtonThemeData, Expanded, FloatingActionButton, FloatingActionButtonThemeData, FontWeight, Form, FormState, GlobalKey, Icon, IconButton, Icons, Image, InkWell, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialColor, MaterialPageRoute, Navigator, Offset, OutlineInputBorder, OutlinedButton, Padding, Radius, RoundedRectangleBorder, Row, Scaffold, SingleChildScrollView, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextAlign, TextEditingController, TextField, TextFormField, TextInputType, TextOverflow, TextStyle, Theme, ThemeData, VisualDensity, VoidCallback, Widget, runApp show AppBar, AppBarTheme, BorderRadius, BorderSide, BoxDecoration, BoxFit, BoxShadow, BuildContext, Card, CardTheme, Center, ClipRRect, Color, Colors, Column, Container, CrossAxisAlignment, DropdownButtonFormField, DropdownMenuItem, EdgeInsets, ElevatedButton, ElevatedButtonThemeData, Expanded, FloatingActionButton, FloatingActionButtonThemeData, FontWeight, Form, FormState, GlobalKey, Icon, IconButton, Icons, Image, InkWell, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialColor, MaterialPageRoute, Navigator, Offset, OutlineInputBorder, OutlinedButton, Padding, Radius, RoundedRectangleBorder, Row, Scaffold, SingleChildScrollView, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextAlign, TextEditingController, TextField, TextFormField, TextInputType, TextOverflow, TextStyle, Theme, ThemeData, VisualDensity, VoidCallback, Widget, runApp;
import 'package:flutter/services.dart'; // Para "TextInputFormatter"

void main() {
  runApp(MyApp());
}

// Classe do Modelo de Dados
class Product {
  String id;
  String name;
  String category;
  String description;
  double price;
  String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// Ponto de entrada da Aplicação
// --- Apenas esta parte foi modificada (cor do app) --- //

class MyApp extends StatelessWidget {
  // Cor principal baseada nos protótipos
  static const MaterialColor mainAppColor = MaterialColor(
    0xFF2E7D32, // ALTERADO AQUI - Cor principal verde
    <int, Color>{
      50: Color(0xFFE8F5E9),   // ALTERADO AQUI
      100: Color(0xFFC8E6C9),  // ALTERADO AQUI
      200: Color(0xFFA5D6A7),  // ALTERADO AQUI
      300: Color(0xFF81C784),  // ALTERADO AQUI
      400: Color(0xFF66BB6A),  // ALTERADO AQUI
      500: Color(0xFF4CAF50),  // ALTERADO AQUI
      600: Color(0xFF43A047),  // ALTERADO AQUI
      700: Color(0xFF388E3C),  // ALTERADO AQUI
      800: Color(0xFF2E7D32),  // ALTERADO AQUI
      900: Color(0xFF1B5E20),  // ALTERADO AQUI
    },
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: mainAppColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color(0xFFF5F5F5), // Um fundo cinza claro
        appBarTheme: AppBarTheme(
          backgroundColor: mainAppColor,
          foregroundColor: Colors.white, // Cor do texto e ícones na AppBar
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: mainAppColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: mainAppColor,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardTheme(
          elevation: 4.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // Define as rotas
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/error': (context) => ErrorScreen(),
        '/list': (context) => ProductListScreen(),
        // Telas de Adicionar/Editar são chamadas via MaterialPageRoute
        // para poderem retornar dados
      },
    );
  }
}

// --- Tela de Login (1) ---
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController(text: 'admin@exemplo.com');
  final _passController = TextEditingController(text: '123456');
  bool _obscureText = true;

  void _login() {
    // Credenciais fixas para o exemplo
    if (_userController.text == 'admin@exemplo.com' &&
        _passController.text == '123456') {
      // Sucesso: Substitui a tela de login pela lista de produtos
      Navigator.pushReplacementNamed(context, '/list');
    } else {
      // Erro: Mostra a tela de erro
      Navigator.pushNamed(context, '/error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App - Login'),
        centerTitle: true, // centraliza o titulo
        automaticallyImplyLeading: false, // Remove a seta de "voltar"
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Entre com Suas Credenciais',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _userController,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                child: Text('Entrar', style: TextStyle(fontSize: 18)),
                onPressed: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Tela de Erro (2) ---
class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App - Erro'),
        centerTitle: true, // centraliza o titulo
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Credenciais Inválidas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Tente novamente',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                child: Text('Voltar para Login', style: TextStyle(fontSize: 18)),
                onPressed: () {
                  // Volta para a tela anterior (Login)
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Tela de Lista de Produtos (3) ---
class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Dados mocados (mock data) iniciais, conforme protótipo
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Smartphone Samsung Galaxy S22',
      category: 'Celulares',
      description: 'Tela AMOLED 6.5", 128GB de armazenamento',
      price: 3200.00,
      imageUrl: 'https://placehold.co/100x100/E8E8E8/000000?text=S22',
    ),
    Product(
      id: '2',
      name: 'Cadeira Gamer ThunderX',
      category: 'Móveis',
      description: 'Cadeira ergonômica com ajuste de altura',
      price: 1200.00,
      imageUrl: 'https://placehold.co/100x100/E8E8E8/000000?text=Cadeira',
    ),
    Product(
      id: '3',
      name: 'Monitor LG ULTRAWide 29"',
      category: 'Eletrônicos',
      description: 'Monitor com resolução Full HD',
      price: 1800.00,
      imageUrl: 'https://placehold.co/100x100/E8E8E8/000000?text=Monitor',
    ),
    Product(
      id: '4',
      name: 'Teclado Mecânico RGB',
      category: 'Periféricos',
      description: 'Teclado com switches mecânicos e RGB',
      price: 350.00,
      imageUrl: 'https://placehold.co/100x100/E8E8E8/000000?text=Teclado',
    ),
    Product(
      id: '5',
      name: 'Notebook Gamer Pro',
      category: 'Eletrônicos',
      description: 'Processador i7, 16GB RAM, SSD 512GB',
      price: 4500.00,
      imageUrl: 'https://placehold.co/100x100/E8E8E8/000000?text=Notebook',
    ),
  ];

  // Calcula o total
  double _calculateTotal() {
    return _products.fold(0.0, (sum, item) => sum + item.price);
  }

  // Navega para a tela de adicionar
  void _navigateToAddProduct() async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductScreen()),
    );

    if (newProduct != null && newProduct is Product) {
      setState(() {
        _products.add(newProduct);
      });
    }
  }

  // Navega para a tela de editar
  void _navigateToEditProduct(Product product, int index) async {
    final updatedProduct = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProductScreen(product: product),
      ),
    );

    if (updatedProduct != null && updatedProduct is Product) {
      setState(() {
        _products[index] = updatedProduct;
      });
    }
  }

  // Exclui um produto
  void _deleteProduct(String id) {
    setState(() {
      _products.removeWhere((product) => product.id == id);
    });
  }

  // Formata o preço para o padrão BRL
  String _formatCurrency(double price) {
    return 'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App - Lista de Produtos'),
        centerTitle: true, // centraliza o titulo
        // O `automaticallyImplyLeading: false` pode ser removido
        // se quisermos a seta de voltar (que não faz sentido aqui)
        // A tela de login foi substituída, então não há para onde "voltar"
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return ProductCard(
                  product: product,
                  onEdit: () => _navigateToEditProduct(product, index),
                  onDelete: () => _deleteProduct(product.id),
                  formatCurrency: _formatCurrency,
                );
              },
            ),
          ),
          // Rodapé com o Total
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _formatCurrency(_calculateTotal()),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddProduct,
        child: Icon(Icons.add),
        tooltip: 'Adicionar Produto',
      ),
    );
  }
}

// Card customizado para o Produto
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final String Function(double) formatCurrency;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
    required this.formatCurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onEdit, // Permite editar ao tocar no card
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[200],
                    child: Icon(Icons.image, color: Colors.grey[400]),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      product.category,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      product.description,
                      style: TextStyle(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      formatCurrency(product.price),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.0),
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red[700]),
                onPressed: onDelete,
                tooltip: 'Excluir',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Tela de Adicionar Produto (4) ---
class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageUrlController = TextEditingController(); // Adicionado para imagem

  String? _selectedCategory;
  final List<String> _categories = [
    'Celulares',
    'Móveis',
    'Eletrônicos',
    'Periféricos',
    'Outros'
  ];

  void _saveProduct() {
    // Valida o formulário
    if (_formKey.currentState!.validate()) {
      // Cria o novo produto
      final newProduct = Product(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        category: _selectedCategory!,
        description: _descController.text,
        price: double.tryParse(_priceController.text.replaceAll(',', '.')) ?? 0.0,
        imageUrl: _imageUrlController.text.isNotEmpty
            ? _imageUrlController.text
            : 'https://placehold.co/100x100/E8E8E8/000000?text=Novo',
      );

      // Retorna o novo produto para a tela anterior
      Navigator.pop(context, newProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App - Adicionar Produto'),
        centerTitle: true, // centraliza o titulo
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // Nome
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome do Produto *',
                hintText: 'Digite o nome do produto',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 120,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o Nome do Produto';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Categoria
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Categoria *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              hint: Text('Selecione a Categoria'),
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Selecione a Categoria';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Descrição
            TextFormField(
              controller: _descController,
              decoration: InputDecoration(
                labelText: 'Descrição *',
                hintText: 'Descreva o produto',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 500,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe a Descrição';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Preço
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Preço *',
                hintText: 'R\$ 0,00',
                prefixText: 'R\$ ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+[,.]?\d{0,2}')),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o Preço';
                }
                if (double.tryParse(value.replaceAll(',', '.')) == null) {
                  return 'Preço inválido';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            
            // URL da Imagem (Opcional)
            TextFormField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                labelText: 'URL da Imagem (Opcional)',
                hintText: 'https://...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.url,
            ),
            SizedBox(height: 32),

            // Botões
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Apenas fecha a tela
                    },
                    child: Text('Cancelar'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      foregroundColor: Theme.of(context).primaryColor,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveProduct,
                    child: Text('Salvar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- Tela de Editar Produto (5) ---
class EditProductScreen extends StatefulWidget {
  final Product product;

  const EditProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _priceController;
  late TextEditingController _imageUrlController;
  
  String? _selectedCategory;
  final List<String> _categories = [
    'Celulares',
    'Móveis',
    'Eletrônicos',
    'Periféricos',
    'Outros'
  ];

  @override
  void initState() {
    super.initState();
    // Inicializa os controladores com os dados do produto
    _nameController = TextEditingController(text: widget.product.name);
    _descController = TextEditingController(text: widget.product.description);
    _priceController = TextEditingController(
        text: widget.product.price.toStringAsFixed(2).replaceAll('.', ','));
    _imageUrlController = TextEditingController(text: widget.product.imageUrl);
    _selectedCategory = widget.product.category;
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      // Cria o produto atualizado
      final updatedProduct = Product(
        id: widget.product.id, // Mantém o ID original
        name: _nameController.text,
        category: _selectedCategory!,
        description: _descController.text,
        price: double.tryParse(_priceController.text.replaceAll(',', '.')) ?? 0.0,
        imageUrl: _imageUrlController.text.isNotEmpty
            ? _imageUrlController.text
            : 'https://placehold.co/100x100/E8E8E8/000000?text=Editado',
      );

      // Retorna o produto atualizado
      Navigator.pop(context, updatedProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Produto'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // Nome
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome do Produto *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 120,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o Nome do Produto';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Categoria
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Categoria *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Selecione a Categoria';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Descrição
            TextFormField(
              controller: _descController,
              decoration: InputDecoration(
                labelText: 'Descrição *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 500,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe a Descrição';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Preço
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Preço *',
                prefixText: 'R\$ ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+[,.]?\d{0,2}')),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o Preço';
                }
                if (double.tryParse(value.replaceAll(',', '.')) == null) {
                  return 'Preço inválido';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            
            // URL da Imagem
            TextFormField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                labelText: 'URL da Imagem',
                hintText: 'https://...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.url,
            ),
            SizedBox(height: 32),

            // Botões
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Apenas fecha a tela
                    },
                    child: Text('Cancelar'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      foregroundColor: Theme.of(context).primaryColor,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveChanges,
                    child: Text('Salvar Alterações'),
                    // Adiciona ícone como no protótipo
                    //icon: Icon(Icons.save),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
