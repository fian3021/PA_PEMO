import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_mode_data.dart';
import '../widget/drawer.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<FAQItem> faqItems = [
    FAQItem(
      category: 'FAQ Umum',
      question: 'Apa itu BantuBersama?',
      answer:
          'BantuBersama adalah website untuk menggalang dana dan berdonasi secara online terpopuler di Indonesia. Di luar negeri website sejenis disebut juga sebagai Crowdfunding Platform.',
    ),
    FAQItem(
      category: 'FAQ Umum',
      question: 'Contoh galang dananya seperti apa?',
      answer:
          'Mulai dari galang dana untuk bantuan biaya pengobatan, memberikan beasiswa bagi yang membutuhkan, program yayasan/panti asuhan, mendirikan rumah ibadah/sekolah/infrastruktur umum, santunan bencana alam hingga galang dana antar alumni/komunitas, dll.',
    ),
    FAQItem(
      category: 'FAQ Umum',
      question: 'Apakah BantuBersama langsung memberikan dana?',
      answer:
          'Tidak. BantuBersama hanya menyediakan fasilitas website untuk menggalang dana secara online, kami tidak memiliki dana yang bisa disalurkan. Keberhasilan sebuah penggalangan dana sangat bergantung pada kualitas konten, luas jaringan dan upaya galang dana yang dilakukan.',
    ),
    FAQItem(
      category: 'FAQ Penggalang',
      question: 'Apa itu Galang Dana (campaign)? ',
      answer:
          'Galang dana (campaign) merupakan kegiatan mencari atau menghimpun dana untuk tujuan tertentu.',
    ),
    FAQItem(
      category: 'FAQ Penggalang',
      question: 'Siapa saja yang bisa menggalang dana di BantuBersama?',
      answer:
          'BantuBersama memfasilitasi siapa saja yang ingin menggalang dana. BantuBersama telah digunakan oleh ribuan pengguna mulai dari NGO global, yayasan lokal, komunitas, himpunan alumni, mahasiswa, artis, hingga individu/pribadi yang ingin menggalang dana untuk tujuan sosial, membantu sesama.',
    ),
    FAQItem(
      category: 'FAQ Penggalang',
      question: 'Bagaimana cara menjadi penggalang dana di platform ini?',
      answer:
          'Untuk menjadi penggalang dana, Anda perlu mendaftar dan mengikuti langkah-langkah yang tertera di halaman pendaftaran penggalang.',
    ),
    FAQItem(
      category: 'FAQ Penggalang',
      question: 'Bagaimana contoh deskripsi campaign yang baik? ',
      answer:
          'Tuliskan secara detail tentang campaign Anda, berikan foto yang menarik, dan sertakan latar belakang pembuatan campaign. Selain itu, sertakan kontak Anda sehingga publik lebih percaya dengan campaign yang sedang Anda lakukan.',
    ),
    FAQItem(
      category: 'FAQ Donatur',
      question: 'Bagaimana cara melakukan donasi?',
      answer:
          'Anda dapat melakukan donasi dengan masuk ke akun Anda, pilih kampanye yang ingin Anda dukung, dan isi form donasi.',
    ),
    FAQItem(
      category: 'FAQ Donatur',
      question: 'Bagaimana cara berdonasi tanpa mencantumkan nama (anonim)?',
      answer:
          'Apabila donatur tidak menginginkan namanya dicantumkan pada halaman campaign, silakan klik pilihan untuk berdonasi sebagai anonim setelah memasukan nominal donasi. Meski memilih anonim, Anda tetap diwajibkan mengisi data diri yang diminta agar tim Kitabisa tetap dapat melaporkan status donasi dan mendapat update dari campaigner.',
    ),
    // Tambahkan FAQItem lainnya sesuai kebutuhan
  ];

  String selectedCategory = 'Semua';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('FAQ', style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(
                    category: 'Semua',
                    onPressed: () => _onFilterButtonPressed('Semua')),
                // FilterButton(
                //     category: 'Umum',
                //     onPressed: () => _onFilterButtonPressed(
                //         'FAQ Umum')), // P // Perubahan di sini
                FilterButton(
                    category: 'Penggalang',
                    onPressed: () => _onFilterButtonPressed(
                        'FAQ Penggalang')), // Perubahan di sini
                FilterButton(
                    category: 'Donatur',
                    onPressed: () => _onFilterButtonPressed(
                        'FAQ Donatur')), // Perubahan di sini
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: faqItems.length,
              itemBuilder: (context, index) {
                if (selectedCategory == 'Semua' ||
                    faqItems[index].category == selectedCategory) {
                  return ExpansionTile(
                    title: Text(faqItems[index].question),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(faqItems[index].answer),
                      ),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onFilterButtonPressed(String category) {
    setState(() {
      selectedCategory = category;
    });
  }
}

class FilterButton extends StatelessWidget {
  final String category;
  final VoidCallback onPressed;

  FilterButton({required this.category, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(category),
    );
  }
}

class FAQItem {
  final String category;
  final String question;
  final String answer;

  FAQItem(
      {required this.category, required this.question, required this.answer});
}
