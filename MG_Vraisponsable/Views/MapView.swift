//
//  MapView.swift
//  projet
//
//  Created by apprenant42 on 18/09/2023.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapView: View {
    
    @State private var region =
    MKCoordinateRegion (center: CLLocationCoordinate2D(latitude: 50.633333,  longitude: 3.066667),
                        span: MKCoordinateSpan(latitudeDelta: 0.02,
                                               longitudeDelta: 0.02)
    )
    
    @State private var searchText = ""
    @State var selectedType: PlaceType = .all
    
    var displayedPlaces: [Place] {
        switch selectedType {
        case .restos:
            return places.filter{$0.type == PlaceType.restos}
        case .alim:
            return places.filter{$0.type == PlaceType.alim}
        case .ressou:
            return places.filter{$0.type == PlaceType.ressou}
        case .bars:
            return places.filter{$0.type == PlaceType.bars}
        case .magasins:
            return places.filter{$0.type == PlaceType.magasins}
        case .vetements:
            return places.filter{$0.type == PlaceType.vetements}
        case .loisirs:
            return places.filter{$0.type == PlaceType.loisirs}
        case .all:
            return places
        }
    }
    @State var isShowSheet : Bool = false
    var place : Place
    
    @State var selectedPlace : Place = place1
    


    //@EnvironmentObject localSearchService = LocalSearchService
    
    var body: some View {
        
        
        NavigationStack {
            ZStack{

                
                Map(coordinateRegion: $region, annotationItems: displayedPlaces){ place in
                    MapAnnotation(coordinate: place.localisation){
                        Circle()
                            .foregroundColor(circleColor(place.type))
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                isShowSheet = true
                                selectedPlace = place
                        } //ontapgesture
                    }//mapannotation
                }//map
                
                
                
//                TextField("Search", text: $search)
//                                .textFieldStyle(.roundedBorder)
//                                .onSubmit {
//                                    localSearchService.search(query: search)
//                                }

                VStack{
                    VStack{ //BOUTONS TYPES
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                ButtonExt( text: .alim, image: "carrot", clrButton: .yellow, selectedType: $selectedType)
                                
                                ButtonExt(text: .restos, image: "fork.knife", clrButton: .orange, selectedType: $selectedType)
                                
                                ButtonExt(text: .ressou, image: "arrow.3.trianglepath", clrButton: .purple, selectedType: $selectedType)
                                
                                ButtonExt(text: .bars, image: "wineglass", clrButton: .green, selectedType: $selectedType)
                                
                                ButtonExt(text: .magasins, image: "cart", clrButton: .blue, selectedType: $selectedType)
                                
                                ButtonExt(text: .vetements, image: "tshirt.fill", clrButton: .red, selectedType: $selectedType)
                                
                                ButtonExt(text: .loisirs, image: "figure.dance", clrButton: .mint, selectedType: $selectedType)
                                
                            }//hstack
                            .padding(.top, 8)

                        }//scrollview
                        
                        .searchable(text: $searchText)
                        
//                     Lida
//                        TextField(text: "search", text: $search)
//                            .onSubmit {
//                                localSearchService.search(query: search)
//                            }
//

                        
                        .navigationBarTitle("Plan")
                        
                    }//Boutons TYPE
                    .padding(.leading, 10)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            // Effectuez le zoom avant
                            let span = MKCoordinateSpan(
                                latitudeDelta: region.span.latitudeDelta / 2,
                                longitudeDelta: region.span.longitudeDelta / 2
                            )
                            region.span = span
                        }, label: {
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(.accentColor)
                                .bold()
                        }) // bouton ZOOM
                        
                        
                        Button(action: {
                            let span = MKCoordinateSpan(
                                latitudeDelta: region.span.latitudeDelta * 2,
                                longitudeDelta: region.span.longitudeDelta * 2
                            )
                            region.span = span
                        }, label: {
                            Image(systemName: "minus.circle")
                                .font(.title)
                                .foregroundColor(.accentColor)
                                .bold()
                        }) // bouton déZOOM
                        
                        
                        
                    }//hstack boutons Zoom et déZoom
                    .padding(.bottom, 8)

                }
                //smallcircle.filled.circle pour le bouton position 
        

            }//zstack
            .sheet(isPresented:$isShowSheet, content:{
                ModalView(place: selectedPlace)
                    .presentationDetents([.height(250), .large])

            })//sheet(modal)
            
            
        } //navigationstack
        

    }//body
    
    func circleColor(_ placeType: PlaceType) -> Color {
        switch placeType {
        case .alim:
            return .yellow
        case .restos:
            return .orange
        case .ressou:
            return .purple
        case.bars:
            return .green
        case.magasins:
            return .blue
        case.vetements:
            return .red
        case.loisirs:
            return .mint
        default:
            return .gray
       }
    } // fonction qui adapte la couleur du circle à celle du place.type
    
}//struct

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(place: place3)
    }
}

