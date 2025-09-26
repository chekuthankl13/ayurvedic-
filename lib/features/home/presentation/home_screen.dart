import 'package:ayurvedic/core/theme/app_theme.dart';
import 'package:ayurvedic/core/utils/utils.dart';
import 'package:ayurvedic/features/home/domain/entity/patient_entity.dart';
import 'package:ayurvedic/features/home/logic/home_cubit.dart';
import 'package:ayurvedic/widgets/common_widgets.dart';
import 'package:ayurvedic/widgets/pdf_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: Icon(Icons.menu),
        title: Text("Ayurvedic"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  Icon(CupertinoIcons.bell),
                  Positioned(
                    top: 0,
                    right: 5,
                    child: Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state) {
            case Loading _:
              return loading(clr: AppTheme.greenClr);
            case Error e:
              return error(
                e.error,
                onPressed: () {
                  context.read<HomeCubit>().loadPatient();
                },
              );
            case PatientLoaded p:
              return body(p.patients);
            default:
              return loading(clr: AppTheme.greenClr);
          }
        },
      ),
    );
  }

  Widget body(List<PatientEntity> patients) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await context.read<HomeCubit>().loadPatient();
            },
            child: ListView.builder(
              itemCount: patients.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                var data = patients[index];
                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppTheme.greyClr,
                  ),
                  child: Column(
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            "${index + 1}.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          spaceWidth(10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                Text(
                                  data.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        data.patientdetails.isNotEmpty
                                            ? data.patientdetails
                                                  .map((e) => e.treatmentName)
                                                  .toList()
                                                  .join(",")
                                            : "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppTheme.greenClr,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Row(
                                      spacing: 5,
                                      children: [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          data.dateNdTime == "null"
                                              ? "N/A"
                                              : formatDateTime(data.dateNdTime),
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      spacing: 5,
                                      children: [
                                        Icon(
                                          Icons.people_outline,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          data.user,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          spaceWidth(10),
                          Text(
                            "view Booking Detail",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppTheme.greenClr,
                            ),
                            onPressed: () {
                              generateInvoicePdf(data: data);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: normalBtn(
            size: Size(sW(context), 35),
            txt: "REGISTER",
            onpressed: () {
              navigatorKey.currentState!.pushNamed("/register").then((value) {
                if (value != null && value == true) {
                  // ignore: use_build_context_synchronously
                  context.read<HomeCubit>().loadPatient();
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
