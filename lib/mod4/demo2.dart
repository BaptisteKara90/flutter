void main(){

  displayMessage("Coucou", 10);
  displayMessage2("Bonchourhan");
  displayMessage2("Bonchour", number: 6);
  displayMessage3( message: getMessage("Saloute"), number: 8);
}


void displayMessage(String message, int number){

  for(int i = 0; i < number; i++){
    print(message);
  }
}

void displayMessage2(String message, {int number = 1}){
  for(int i = 0; i < number; i++){
    print(message);
  }
}

void displayMessage3({required String message, int number = 1}){
  for(int i = 0; i < number; i++){
    print(message);
  }
}

String getMessage(String message){
  return message;
}