//
//  GeometryEffectView.swift
//  SwiftUIFun
//
//  Created by Raj Raval on 21/04/24.
//

import SwiftUI

struct Ticket {
    let id: Int
    let departureCityCode: String
    let departureAirport: String
    let departureTime: String
    let arrivalCityCode: String
    let arrivalAirport: String
    let arrivalTime: String
    let seatNumber: String
    let seatPosition: String
    let seatType: String
    let gateNumber: String
    let flightNumber: String
    let flightCode: String = "AB-123"
    let color: Color
}

extension Ticket {
    static let displayOne = Ticket(
        id: 1,
        departureCityCode: "BOM",
        departureAirport: "Chatrapati Shivaji Maharaj International Airport",
        departureTime: "14:45",
        arrivalCityCode: "DEL",
        arrivalAirport: "Indira Gandhi International Airport",
        arrivalTime: "16:50",
        seatNumber: "25-B",
        seatPosition: "Middle",
        seatType: "Economy",
        gateNumber: "21",
        flightNumber: "RR 254",
        color: .blue
    )

    static let displayTwo = Ticket(
        id: 2,
        departureCityCode: "BOM",
        departureAirport: "Chatrapati Shivaji Maharaj International Airport",
        departureTime: "14:45",
        arrivalCityCode: "DEL",
        arrivalAirport: "Indira Gandhi International Airport",
        arrivalTime: "16:50",
        seatNumber: "25-B",
        seatPosition: "Middle",
        seatType: "Economy",
        gateNumber: "21",
        flightNumber: "RR 254",
        color: .green
    )

    static let displayThree = Ticket(
        id: 3,
        departureCityCode: "BOM",
        departureAirport: "Chatrapati Shivaji Maharaj International Airport",
        departureTime: "14:45",
        arrivalCityCode: "DEL",
        arrivalAirport: "Indira Gandhi International Airport",
        arrivalTime: "16:50",
        seatNumber: "25-B",
        seatPosition: "Middle",
        seatType: "Economy",
        gateNumber: "21",
        flightNumber: "RR 254",
        color: .orange
    )
}

struct GeometryEffectView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Tickets")
                .font(.h2)
                .padding(.leading, 24)
                .padding(.vertical, 36)
            ScrollView {
                VStack(spacing: 24) {
                    TicketSection(day: "Today", ticket: .displayOne)
                    TicketSection(day: "Tomorrow", ticket: .displayTwo)
                    TicketSection(day: "26th April 2024", ticket: .displayThree)
                }
            }
        }
        .background(.gray.opacity(0.1))
    }
}

struct TicketPassView: View {
    let ticket: Ticket
    var body: some View {
        VStack(spacing: 24) {
            Image(uiImage: .generateQRCode(from: ticket.seatNumber))
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Departure")
                        .font(.pTiny)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading) {
                            Text(ticket.departureCityCode)
                                .font(.p)
                            Text(ticket.departureTime)
                                .font(.pTwoSemiBold)
                        }
                        Text(ticket.departureAirport)
                            .font(.pMicro)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .multilineTextAlignment(.leading)
                Spacer()
                Image(systemName: "airplane")
                    .font(.title2)
                Spacer()
                VStack(alignment: .trailing, spacing: 8) {
                    Text("Arrival")
                        .font(.pTiny)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .trailing, spacing: 12) {
                        VStack(alignment: .trailing) {
                            Text(ticket.arrivalCityCode)
                                .font(.p)
                            Text(ticket.arrivalTime)
                                .font(.pTwoSemiBold)
                        }
                        Text(ticket.arrivalAirport)
                            .font(.pMicro)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .multilineTextAlignment(.trailing)
            }
            HStack {
                TitleSubtitleView(title: "Flight No", subtitle: ticket.flightNumber)
                Spacer()
                TitleSubtitleView(title: "Flight Code", subtitle: ticket.flightCode)
                Spacer()
                TitleSubtitleView(title: "Gate No", subtitle: ticket.gateNumber)
            }
            HStack(spacing: 0) {
                TitleSubtitleView(title: "Seat", subtitle: ticket.seatNumber)
                Spacer()
                TitleSubtitleView(title: "Position", subtitle: ticket.seatPosition)
                Spacer()
                TitleSubtitleView(title: "Type", subtitle: ticket.seatType)
            }
            HStack {
                Text("Enjoy travelling with us")
                    .font(.pItalic)
                    .foregroundStyle(ticket.color)
                Spacer()
                HStack {
                    Text("RR")
                        .font(.pItalic)
                    Image(systemName: "airplane")
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(ticket.color)
                .clipShape(.rect(cornerRadius: 10))
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .background(.background)
        .padding(24)
    }
}

struct TicketSection: View {
    let day: String
    let ticket: Ticket
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(day)
                .font(.pTwo)
            TicketView(ticket: ticket)
        }
        .padding(.horizontal, 24)
    }
}

struct TitleSubtitleView: View {
    let title: String
    let subtitle: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.secondary)
            Text(subtitle)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .font(.pTiny)
    }
}

struct TicketView: View {

    @Namespace private var qrCode
    @State private var showInfoView = false
    let ticket: Ticket

    var body: some View {
        Group {
            if showInfoView {
                TicketPassView(ticket: ticket)
                    .matchedGeometryEffect(id: "ID", in: qrCode)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            showInfoView.toggle()
                        }
                    }
                    .transition(.move(edge: .top).combined(with: .blurReplace))
            } else {
                HStack {
                    VStack {
                        Text("Click QR")
                            .font(.pTwo)
                            .foregroundStyle(.black.opacity(0.3))
                        Image(uiImage: .generateQRCode(from: ticket.seatNumber))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .matchedGeometryEffect(id: "ID", in: qrCode)
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    showInfoView.toggle()
                                }
                            }
                    }
                    .padding(.horizontal, 24)
                    VStack(spacing: 30) {
                        TicketDestinationView(ticket: ticket)
                        TicketSeatView(ticket: ticket)
                    }
                    .padding(14)
                    .background(ticket.color)
                }
            }
        }
        .background(.background)
        .clipShape(.rect(cornerRadius: 22))
    }
}

struct TicketDestinationView: View {
    let ticket: Ticket
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(ticket.departureCityCode)
                    .font(.p)
                    .foregroundStyle(.white)
                Text(ticket.departureTime)
                    .font(.pTwo)
                    .foregroundStyle(.white.opacity(0.7))
            }
            .multilineTextAlignment(.leading)
            Spacer()
            Image(systemName: "airplane")
                .font(.title2)
                .foregroundStyle(.white)
            Spacer()
            VStack(alignment: .trailing) {
                Text(ticket.arrivalCityCode)
                    .font(.p)
                    .foregroundStyle(.white)
                Text(ticket.arrivalTime)
                    .font(.pTwo)
                    .foregroundStyle(.white.opacity(0.7))
            }
            .multilineTextAlignment(.trailing)
        }
        .background(ticket.color)
    }
}

struct TicketSeatView: View {

    let ticket: Ticket

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(ticket.seatType.uppercased())
                Text(ticket.seatNumber)
            }
            .font(.pTwoMono)
            .foregroundStyle(.white)
            Spacer()
            HStack {
                Text("RR")
                    .font(.pItalic)
                Image(systemName: "airplane")
                    .foregroundStyle(ticket.color)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}


#Preview {
    GeometryEffectView()
}





//@Namespace private var qr
//@State private var showQR = false
//if showQR {
//    Rectangle()
//        .fill(.orange)
//        .matchedGeometryEffect(id: "ID", in: qr)
//        .frame(height: 400)
//        .clipShape(.rect(cornerRadius: 14))
//        .padding(.horizontal, 24)
//        .onTapGesture {
//            withAnimation(.snappy) {
//                showQR.toggle()
//            }
//        }
//} else {
//    ZStack(alignment: .leading) {
//        Rectangle()
//            .fill(.green)
//            .frame(height: 200)
//            .clipShape(.rect(cornerRadius: 14))
//        Rectangle()
//            .matchedGeometryEffect(id: "ID", in: qr)
//            .frame(width: 40, height: 40)
//            .onTapGesture {
//                withAnimation(.spring.speed(2)) {
//                    showQR.toggle()
//                }
//            }
//            .padding(.leading)
//    }
//    .padding(.horizontal, 24)
//}
