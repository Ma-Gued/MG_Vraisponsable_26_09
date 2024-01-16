import SwiftUI



struct NotificationView: View {
    
    var place: Place
    
    
    struct NotificationModel: Identifiable {
        var id = UUID()
        var author: String
        var authorImageName: String
        var commentContent: String
        var date: String
        var placeDetails: Place
        init(id: UUID = UUID(), author: String, authorImageName: String, commentContent: String, date: String, placeDetails: Place) {
            self.id = id
            self.author = author
            self.authorImageName = authorImageName
            self.commentContent = commentContent
            self.date = date
            self.placeDetails = placeDetails
        }
        
    }
    
    
    var notif1 = NotificationModel(
        author: "El Market", authorImageName: "em2", commentContent: "La nouvelle collection est arrivée ! 👕", date: "26/09/2023", placeDetails: place7)
    
    var notif2 = NotificationModel(
        author: "La Ressoucerie \nde l'ABEJ", authorImageName: "ar1", commentContent: "Ouverture exceptionnelle le 1er novembre 😍", date: "25/09/2023", placeDetails:place14)
    
    var notif3 = NotificationModel(
        author: "La Café Citoyen", authorImageName: "cc1", commentContent: "Un Bar vient d'être ajouté près de chez vous 🍹🔥", date: "24/09/2023", placeDetails: place5)
    
    
    var notifications: [NotificationModel] {
        [notif1, notif2, notif3]
    }
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(notifications) { notification in
                    VStack{
                        NavigationLink(destination: PlacesDetailsView(place: notification.placeDetails), label: {
                            HStack{
                                Image("\(notification.authorImageName)")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(50)
                                VStack{
                                    Text("\(notification.author)")
                                        .font(Font.custom("AmericanTypewriter-Semibold", size: 14))
                                    
                                        .multilineTextAlignment(.center)
                                        .bold()
                                        .tracking(-1)
                                    
                                    Text("\(notification.date)")
                                        .font(.system(size: 12))
                                    
                                }
                                Text("\(notification.commentContent)")
                                    .font(.system(size: 14))
                                
                                
                                
                                //                                NavigationLink(destination: PlacesDetailsView(place: notification.placeDetails)) {
                                //                                    Image(systemName: "greaterthan")
                                //                                             .resizable()
                                //                                             .frame(width: 8, height: 20)
                                //                                             .foregroundColor(.gray)
                                //                                }
                                
                            }//hstack
                        })
                        
                        
                    }//vstack
                }//foreach
            }//list
            .navigationTitle("Notifications")
        }//navigation view
        
        
        
        
        
        
    }
    
}


struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(place: place1)
    }
}
