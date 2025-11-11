

// Entité User — représente un utilisateur de l'application (métier pur).
class User {
  final String id;       
  final String firstName; 
  final String lastName; 
  final String email;     
  final String? password; // Mot de passe (optionnel)

  // Constructeur immuable 
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.password,  //optionnel
  });

  
  Map<String, dynamic> toJson() => {
    'id': id,                    
    'first_name': firstName,      
    'last_name': lastName,        
    'email': email,               
    if (password != null) 'password': password, // n'ajoute password que s'il existe
  };
}
