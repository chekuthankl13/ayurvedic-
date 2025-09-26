
import 'package:ayurvedic/features/home/domain/entity/patient_entity.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> generateInvoicePdf({required PatientEntity data}) async {
  final pdf = pw.Document();

  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
  );

  final poppinsRegular = pw.Font.ttf(
    await rootBundle.load('assets/fonts/Poppins-Regular.ttf'),
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(20),
      build: (context) {
        return pw.Stack(
          children: [
            pw.Positioned(
              top: 100,
              left: 50,
              right: 50,
              child: pw.Opacity(
                opacity: 0.08,
                child: pw.Image(logoImage, fit: pw.BoxFit.contain),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Header: Logo + Address
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Image(logoImage, width: 80),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text(
                            "KUMARAKOM",
                            style: pw.TextStyle(
                              font: poppinsRegular,
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "Cheepunkal P.O. Kumarakom, Kottayam, Kerala - 686563",
                          ),
                          pw.Text("e-mail: unknown@gmail.com"),
                          pw.Text("Mob: +91 9876543210 | +91 9786543210"),
                          pw.Text("GST No: 32AABCU9603R1ZW"),
                        ],
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 20),

                  // Patient Details
                  pw.Text(
                    "Patient Details",
                    style: pw.TextStyle(
                      font: poppinsRegular,
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.green,
                    ),
                  ),
                  pw.SizedBox(height: 10),

                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Name: ${data.name}"),
                          pw.Text("Address: ${data.address}"),
                          pw.Text("WhatsApp Number: +91  ${data.phone}"),
                        ],
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Booked On:  ${data.createdAt} | 12:12pm"),
                          pw.Text("Treatment Date:  ${data.dateNdTime}"),
                          pw.Text("Treatment Time: 11:00 am"),
                        ],
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 20),
                  pw.Divider(),

                  // Treatment Table
                  // ignore: deprecated_member_use
                  pw.Table.fromTextArray(
                    headers: ['Treatment', 'Price', 'Male', 'Female', 'Total'],
                    data:[ List.generate(data.patientdetails.length,(index) {
                      var i = data.patientdetails[index];
                      return [i.treatment, '₹230', i.female, i.male, '₹2,540'];
                    },) .toList() ]
                    ,
                    headerStyle: pw.TextStyle(
                      font: poppinsRegular,
                      color: PdfColors.green,
                      fontWeight: pw.FontWeight.bold,
                    ),
                    cellAlignment: pw.Alignment.centerLeft,
                    cellStyle: pw.TextStyle(
                      font: poppinsRegular,fontSize: 10),
                    columnWidths: {
                      0: pw.FlexColumnWidth(2),
                      1: pw.FlexColumnWidth(1),
                      2: pw.FlexColumnWidth(1),
                      3: pw.FlexColumnWidth(1),
                      4: pw.FlexColumnWidth(1.5),
                    },
                  ),

                  pw.SizedBox(height: 20),

                  // Amount Summary
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                "Total Amount: ",
                                style: pw.TextStyle(
                                  font: poppinsRegular,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text("₹${data.totalAmount}"),
                            ],
                          ),
                          pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [pw.Text("Discount: "), pw.Text("₹${data.discountAmount}")],
                          ),
                          pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [pw.Text("Advance: "), pw.Text("₹${data.advanceAmount}")],
                          ),
                          pw.Divider(),
                          pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                "Balance: ",
                                style: pw.TextStyle(
                                  font: poppinsRegular,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                "₹${data.balanceAmount}",
                                style: pw.TextStyle(
                                  font: poppinsRegular,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 40),

                  // Footer
                  pw.Center(
                    child: pw.Column(
                      children: [
                        pw.Text(
                          "Thank you for choosing us",
                          style: pw.TextStyle(
                            font: poppinsRegular,
                            color: PdfColors.green,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "Your well-being is our commitment, and we're honored you've entrusted us with your health journey",
                          style: pw.TextStyle(
                            font: poppinsRegular,
                            fontSize: 10,
                            color: PdfColors.grey600,
                          ),
                          textAlign: pw.TextAlign.center,
                        ),
                        pw.SizedBox(height: 20),
                        pw.Text(
                          "❤️",
                          style: pw.TextStyle(
                            font: poppinsRegular,fontSize: 20),
                        ), // Replace with image signature if needed
                      ],
                    ),
                  ),
                  pw.Spacer(),
                  pw.Center(
                    child: pw.Text(
                      "“Booking amount is non-refundable, and it's important to arrive on the allotted time for your treatment”",
                      style: pw.TextStyle(
                        font: poppinsRegular,
                        fontSize: 8,
                        color: PdfColors.grey500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  // Preview or print
  await Printing.layoutPdf(onLayout: (format) => pdf.save());
}
