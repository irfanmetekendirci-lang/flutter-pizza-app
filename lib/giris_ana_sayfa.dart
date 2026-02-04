import 'package:flutter/material.dart';
import 'package:odev_3/renkler.dart';

class GirisAnaSayfa extends StatefulWidget {
  const GirisAnaSayfa({super.key});

  @override
  State<GirisAnaSayfa> createState() => _GirisAnaSayfaState();
}

class _GirisAnaSayfaState extends State<GirisAnaSayfa> {
  final TextEditingController _controller = TextEditingController();
  bool tiklandiMi = false;

  @override
  void initState() {
    _controller;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamWhite,
      appBar: AppBar(
        backgroundColor: phoenixRed,
        title: tiklandiMi
            ? TextFormField( //tiklandiMi = true olursa çalışsacak kısım. (yani "?" sonrası)
          controller: _controller,
          cursorColor: creamWhite,
          style: TextStyle(color: creamWhite, fontSize: 20),
          decoration: InputDecoration(
            // 1. İKONU BAŞA ALDIK
            prefixIcon: Icon(Icons.search, color: creamWhite),

            // 2. OVAL DÖRTGEN VE DOLGU (Kutuyu görünür yapar)
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),

            hintText: "Canın ne çekiyor?",
            hintStyle: TextStyle(color: creamWhite.withOpacity(0.7)),

            // 3. KENARLARI OVAL YAPMA
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25), // Daha oval bir görünüm
              borderSide: BorderSide.none, // Dış çizgiyi kaldırır
            ),
            contentPadding: EdgeInsets.zero, // Yazıyı kutu içinde ortalar
          ),
        )
        //tiklandiMi = false olunca çalışacak kısım. (yani ":" sonrası)
            : Text("Search Bar", style: TextStyle(color: creamWhite)),
        actions: [
          // Sağ tarafta sadece iptal butonu kalsın
          if (tiklandiMi)
            IconButton(
              onPressed: () {
                setState(() {
                  tiklandiMi = false;
                  _controller.clear();
                });
              },
              icon: Icon(Icons.cancel_outlined, color: creamWhite),
            )
          else
            IconButton(
              onPressed: () {
                setState(() {
                  tiklandiMi = true;
                });
              },
              icon: Icon(Icons.search, color: creamWhite),
            ),
        ],
      ),
        // BODY KISMI
        body: SingleChildScrollView( // TÜM SAYFAYI KAYDIRILABİLİR YAPAR
          child: Column(
            children: [
              // 1. KATEGORİLER YAZISI
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Kategoriler", style: TextStyle(color: royalGreen, fontSize: 22, fontWeight: FontWeight.bold)),
                ),
              ),

          // 2. KATEGORİ LİSTESİ
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                kategoriButonu("🍕 Pizzalar"),
                kategoriButonu("🥤 İçecekler"),
                kategoriButonu("🍰 Tatlılar"),
                kategoriButonu("🍽️ Menüler"),
                kategoriButonu("🏪 Restorantlarımız"),
              ],
            ),
          ),

          // GÜNÜN MENÜLERİ :
           Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Günün Menüleri",
                style: TextStyle(color: royalGreen ,fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          //PİZZA LİSTESİ
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                //pizzaKarti burda çağrılacak
                pizzaKarti("https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg", "Margarita", "200-450"),
                pizzaKarti("https://img.freepik.com/free-photo/top-view-pepperoni-pizza-with-mushroom-sausages-bell-pepper-olive-corn-black-wooden_141793-2158.jpg", "Karışık Pizza", "250-500"),
                pizzaKarti("https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1000&auto=format&fit=crop", "Mantar Harikası", "250-500"),
                pizzaKarti("https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1000&auto=format&fit=crop", "Tavuklu", "220-470"),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Sana Özel Menüler",style: TextStyle(color: royalGreen,fontSize: 22,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
              height: 250,
              child: ListView(
              scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  pizzaKarti("https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1000&auto=format&fit=crop", "Tavuklu", "220-470"),
                  // Buraya istediğin kadar daha pizzaKarti ekleyebilirsin
                  pizzaKarti("https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg", "Eko Menü", "150-300"),
              ],
            ),
          ),
        ],
      ),
        ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),blurRadius: 10, spreadRadius: 1
            ),
          ],
        ),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Toplam Tutar",style: TextStyle(color: Colors.grey)),
                  Text("449.99₺",style: TextStyle(color: royalGreen,fontSize: 22,fontWeight: FontWeight.bold))
                ],
              ),
              ElevatedButton(onPressed: (){print("Sipariş onaylandı");},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: phoenixRed,
                    minimumSize: const Size(160, 55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  child: const Text("Sepeti Onayla", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    ); // Scaffold burada bitti
  } // Build metodu burada bitti

  // FONKSİYONU BURAYA (Sınıfın içine ama build'in dışına) KOYUYORUZ
  //KATEGORİ BUTONLARI
  Widget kategoriButonu(String metin) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: royalGreen,
            shape: const StadiumBorder(),
          ),
          child: Text(metin, style: TextStyle(color: creamWhite))),
    );
  }

  //PİZZA LİSTESİ
Widget pizzaKarti(String resimYolu,String isim,String fiyat){
    return Container(
      width: 180, //kartın genişliği
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05),blurRadius: 10,spreadRadius: 2,offset: const Offset(0, 4),)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //RESİM KISMI
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
            resimYolu,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isim, style: TextStyle(color: phoenixRed, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("$fiyat TL", style: TextStyle(color: phoenixRed, fontWeight: FontWeight.bold)),
                ],
              ),
          ),
        ],
      ),

    );
}

} // Sınıfın en son parantezi