import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});
  
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  bool isSignedIn = true;
  String fullName ='Jovan Barracuda Yusa';
  String userName = 'Jovan';
  int favoriteCandiCount = 0;

  //Todo: 5 implementasi fungsi signin
  void signIn(){
    setState(() {
      isSignedIn = isSignedIn;
    });
  }
  //Todo: 6 implementasi singout
  void signOut(){
    setState(() {
      isSignedIn = isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                //TODO: 2 profile header
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if(isSignedIn)
                          IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                //TODO: 3. profile
                //baris 1 username
                const SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(height: 4,), 
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/3,
                      child: Row(
                        children: [
                          Icon(Icons.lock, color: Colors.amber,),
                          SizedBox(width: 8,),
                          Text('Pengguna', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text( '$userName',
                        style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
                //baris 2 nama
                const SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(height: 4,), 
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/3,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue,),
                          SizedBox(width: 8,),
                          Text('Nama', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text( '$fullName',
                        style: TextStyle(fontSize: 18),
                    )),
                    if (isSignedIn) const Icon(Icons.edit),
                  ],
                ),
                //baris 3 favorit
                const SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                const SizedBox(height: 4,), 
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/3,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red,),
                          SizedBox(width: 8,),
                          Text('Favorit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text( '$favoriteCandiCount',
                        style: TextStyle(fontSize: 18),
                    )),
                  ],
                ),
                //TODO: 4 signout
                const SizedBox(
                  height: 4,
                ),
                Divider(color: Colors.deepPurple,),
                const SizedBox(height: 20,),
                isSignedIn ? TextButton(onPressed: signOut, child: const Text('Sign Out'))
                  : TextButton(onPressed: signIn, child: const Text('Sign In'))
              ],
            ),
          ),
        ],
      ),
    );
  }

}