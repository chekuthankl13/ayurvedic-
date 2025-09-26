import 'package:ayurvedic/core/db/db_service.dart';
import 'package:ayurvedic/core/di/core_di.dart';
import 'package:ayurvedic/core/theme/app_theme.dart';
import 'package:ayurvedic/core/utils/utils.dart';
import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';
import 'package:ayurvedic/features/register/domain/entity/treatment_entity.dart';
import 'package:ayurvedic/features/register/logic/int_cubit.dart';
import 'package:ayurvedic/features/register/logic/register_cubit.dart';
import 'package:ayurvedic/features/register/logic/sex_cubit.dart';
import 'package:ayurvedic/features/register/logic/treatment_cubit.dart';
import 'package:ayurvedic/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameCntr = TextEditingController();
  TextEditingController numberCntr = TextEditingController();
  TextEditingController addressCntr = TextEditingController();
  TextEditingController locationCntr = TextEditingController();
  TextEditingController branchCntr = TextEditingController();
  TextEditingController branchIdCntr = TextEditingController();
  TextEditingController totalAmountCntr = TextEditingController();
  TextEditingController discountCntr = TextEditingController();
  TextEditingController advanceAmountCntr = TextEditingController();
  TextEditingController balanceCntr = TextEditingController();
  TextEditingController treatmentDateCntr = TextEditingController();
  TextEditingController treatmentHourCntr = TextEditingController();
  TextEditingController treatmentMinuteCntr = TextEditingController();

  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  List<BranchEntity> branchList = [];
  List<TreatmentEntity> treatmentList = [];

  @override
  void dispose() {
    nameCntr.dispose();
    numberCntr.dispose();
    addressCntr.dispose();
    locationCntr.dispose();
    branchCntr.dispose();
    branchIdCntr.dispose();
    totalAmountCntr.dispose();
    discountCntr.dispose();
    advanceAmountCntr.dispose();
    balanceCntr.dispose();
    treatmentDateCntr.dispose();
    treatmentHourCntr.dispose();
    treatmentMinuteCntr.dispose();
    EasyLoading.dismiss();
    super.dispose();
  }

  @override
  void initState() {
    context.read<IntCubit2>().update(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text("Regsiter"),
      ),

      body: Form(
        key: fkey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 10,
            children: [
              spaceHeight(10),
              field(cntr: nameCntr, hint: "Enter Your full name", txt: "Name"),
              field(
                cntr: numberCntr,
                isNum: true,
                hint: "Enter Your Whatsapp number",
                txt: "Whatsapp Number",
              ),
              field(
                cntr: addressCntr,
                isThreeLine: true,
                hint: "Enter Your full address",
                txt: "Address",
              ),
              readOnly(
                cntr: locationCntr,
                hint: "Choose your location",
                txt: "Location",
                ic: Icons.keyboard_arrow_down_rounded,
                ontap: () {
                  sheetNormal(
                    context,
                    cntr: locationCntr,
                    txt: "",
                    item: locationList,
                  );
                },
              ),

              readOnly(
                cntr: branchCntr,
                hint: "Select the branch",
                txt: "Branch",
                ic: Icons.keyboard_arrow_down_rounded,
                ontap: () async {
                  EasyLoading.show();
                  var res = await context.read<RegisterCubit>().loadBranch();
                  if (res['status'] == "ok") {
                    EasyLoading.dismiss();
                    branch(
                      // ignore: use_build_context_synchronously
                      context,
                      cntr: branchCntr,
                      idCntr: branchIdCntr,
                      item: res['data'],
                      txt: "select",
                    );
                  } else {
                    EasyLoading.dismiss();
                    EasyLoading.showError(res['error']);
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Treatments",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.blackClr,
                    ),
                  ),
                ],
              ),
              BlocBuilder<TreatmentCubit, List<Map<String, String>>>(
                builder: (context, state) {
                  return state.isEmpty
                      ? Text("* No Treatment added *")
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.length,
                          itemBuilder: (context, index) {
                            var data = state[index];
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
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    data['treatment_name']
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<TreatmentCubit>()
                                                        .removeEntryById(
                                                          data['id'].toString(),
                                                        );
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          const Color.fromARGB(
                                                            255,
                                                            222,
                                                            85,
                                                            75,
                                                          ),
                                                    ),
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Female",
                                            style: TextStyle(
                                              color: AppTheme.greenClr,
                                              fontSize: 12,
                                            ),
                                          ),
                                          spaceWidth(10),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: AppTheme.greyClr,
                                              border: Border.all(
                                                color: Colors.black12,
                                              ),
                                            ),
                                            child: Text(
                                              data['female'].toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Text(
                                            "Male",
                                            style: TextStyle(
                                              color: AppTheme.greenClr,
                                              fontSize: 12,
                                            ),
                                          ),
                                          spaceWidth(10),

                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: AppTheme.greyClr,
                                              border: Border.all(
                                                color: Colors.black12,
                                              ),
                                            ),
                                            child: Text(
                                              data['male'].toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                },
              ),
              icBtn(
                ic: Icons.add,
                size: Size(sW(context) / 1.5, 35),
                txt: "Add Treatment",
                onpressed: () async {
                  treatmentList.clear();
                  EasyLoading.show();
                  var res = await context.read<RegisterCubit>().loadTreatment();
                  if (res['status'] == "ok") {
                    EasyLoading.dismiss();
                    treatmentList.addAll(res['data']);

                    context.read<SexCubit>().reset();
                    await showDialog(
                      // ignore: use_build_context_synchronously
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => sheet(context),
                    );
                  } else {
                    EasyLoading.dismiss();
                    EasyLoading.showError(res['error']);
                  }
                },
              ),
              field(
                isNum: true,
                cntr: totalAmountCntr,
                hint: "0.0",
                txt: "Total Amount",
              ),

              field(
                isReq: false,
                isNum: true,
                cntr: discountCntr,
                hint: "0.0",
                txt: "Discount Amount",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.blackClr,
                    ),
                  ),
                ],
              ),
              BlocBuilder<IntCubit2, int?>(
                builder: (context, state) {
                  return Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio<int>(
                            value: 0,
                            groupValue: state,
                            onChanged: (value) {
                              context.read<IntCubit2>().update(value);
                            },
                          ),
                          Text("Cash"),
                        ],
                      ),

                      Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            groupValue: state,
                            onChanged: (value) {
                              context.read<IntCubit2>().update(value);
                            },
                          ),
                          Text("Card"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<int>(
                            value: 2,
                            groupValue: state,
                            onChanged: (value) {
                              context.read<IntCubit2>().update(value);
                            },
                          ),
                          Text("UPI"),
                        ],
                      ),
                    ],
                  );
                },
              ),
              field(
                isReq: false,

                isNum: true,
                cntr: advanceAmountCntr,
                hint: "0.0",
                txt: "Advance Amount",
              ),
              field(
                isNum: true,
                cntr: balanceCntr,
                hint: "0.0",
                txt: "Balance Amount",
              ),
              readOnly(
                ic: Icons.calendar_today,
                cntr: treatmentDateCntr,
                hint: "",
                txt: "Treatment Date",
                ontap: () {
                  date(
                    context,
                    cntr: treatmentDateCntr,
                    firstdate: DateTime(2000),
                    lastdate: DateTime(DateTime.now().year + 2),
                  );
                },
              ),

              readOnlyRow(
                cntr2: treatmentMinuteCntr,
                cntr: treatmentHourCntr,
                hint: "Hour",
                hint2: "Minutes",
                ic: Icons.keyboard_arrow_down_rounded,
                ic2: Icons.keyboard_arrow_down_rounded,
                ontap2: () {
                  pickMinute(context, treatmentMinuteCntr);
                },
                ontap: () {
                  pickHour(context, treatmentHourCntr);
                },
                txt: "Treatment Time",
              ),
              normalBtn(
                size: Size(sW(context), 35),
                txt: "Save",
                onpressed: () async {
                  var treatments = context.read<TreatmentCubit>().state;
                  var payment = context.read<IntCubit2>().state;
                  if (treatments.isEmpty) {
                    errorToast(context, msg: "please add treatmenet");
                  } else {
                    if (payment == null) {
                      errorToast(context, msg: "please select payment");
                    } else {
                      if (fkey.currentState!.validate()) {
                        EasyLoading.show();
                        Map<String, dynamic>
                        res = await context.read<RegisterCubit>().register(
                          name: nameCntr.text,
                          address: addressCntr.text,
                          advanceAmount: advanceAmountCntr.text,
                          balanceAmount: balanceCntr.text,
                          branch: branchIdCntr.text,
                          discountAmount: discountCntr.text,
                          phone: numberCntr.text,
                          totalAmount: totalAmountCntr.text,
                          dateEndTime:
                              "${treatmentDateCntr.text}-${treatmentHourCntr.text}:${treatmentMinuteCntr.text}",
                          exceutive:
                              sl<DbService>().getUserDetail()?.username ?? "",
                          female: [],
                          male: [],
                          payment: payment == 0
                              ? "Cash"
                              : payment == 1
                              ? "Card"
                              : "Upi",
                          treatments:
                              treatments.map((e) => e['id']).toList()
                                  as List<String?>,
                        );

                        if (res['status'] == "ok") {
                          EasyLoading.dismiss();
                          EasyLoading.showSuccess(
                            "patient successfully registered !!",
                          );
                          navigatorKey.currentState!.pop(true);
                        } else {
                          EasyLoading.dismiss();
                          EasyLoading.showError(res['error']);
                        }
                      }
                    }
                  }
                },
              ),
              spaceHeight(10),
            ],
          ),
        ),
      ),
    );
  }

  sheet(BuildContext context) {
    TextEditingController tCntr = TextEditingController();
    TextEditingController tidCntr = TextEditingController();
    // TextEditingController mCntr = TextEditingController();
    // TextEditingController fCntr = TextEditingController();

    return AlertDialog(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: Colors.white,
      titlePadding: EdgeInsets.all(20),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      title: Text("Add Treatment"),
      contentPadding: EdgeInsets.all(10),
      actions: [
        TextButton(
          child: Text("cancel"),
          onPressed: () => navigatorKey.currentState!.pop(),
        ),

        normalBtn(
          size: Size(sW(context) / 2, 35),
          txt: "SAVE",
          onpressed: () async {
            var r = context.read<SexCubit>().state;
            if (tidCntr.text.isEmpty) {
              EasyLoading.showError("please choose treatment");
            } else if (r.female == 0 && r.male == 0) {
              EasyLoading.showError("please add patient");
            } else {
              Map<String, String> value = {
                "treatment_name": tCntr.text,
                "id": tidCntr.text,
                "male": r.male.toString(),
                "female": r.female.toString(),
              };
              BlocProvider.of<TreatmentCubit>(context).addEntry(value);
              navigatorKey.currentState!.pop();
            }
          },
        ),
      ],
      content: SizedBox(
        width: sW(context),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            spacing: 10,
            children: [
              readOnly(
                cntr: tCntr,
                hint: "Choose treatment",
                ic: Icons.keyboard_arrow_down_rounded,
                txt: "Choose treatment",
                ontap: () {
                  treatMent(
                    context,
                    cntr: tCntr,
                    idCntr: tidCntr,
                    item: treatmentList,
                    txt: "select",
                  );
                },
              ),
              Row(
                children: [
                  Text(
                    "Add Patients",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.blackClr,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 10,
                children: [
                  tile(
                    context,
                    isMale: true,
                    onDecrement: () {
                      BlocProvider.of<SexCubit>(context).decrementMale();
                    },
                    onIncrement: () {
                      BlocProvider.of<SexCubit>(context).incrementMale();
                    },
                  ),

                  tile(
                    context,
                    isMale: false,
                    onDecrement: () {
                      BlocProvider.of<SexCubit>(context).decrementFemale();
                    },
                    onIncrement: () {
                      BlocProvider.of<SexCubit>(context).incrementFemale();
                    },
                  ),
                ],
              ),
              spaceHeight(20),
            ],
          ),
        ),
      ),
    );
  }

  List<String> locationList = ["malappuram", "kochi", "palakkad"];

  Row tile(BuildContext context, {onIncrement, onDecrement, isMale}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: sW(context) / 2.5,
              decoration: BoxDecoration(
                color: AppTheme.greyClr,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                isMale ? "Male" : "Female",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.blackClr,
                ),
              ),
            ),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            InkWell(
              onTap: () {
                onIncrement();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.greenClr,
                ),
                alignment: Alignment.center,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),

            BlocBuilder<SexCubit, SexState>(
              builder: (context, state) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.greyClr,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Text(
                    isMale ? state.male.toString() : state.female.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {
                onDecrement();
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.greenClr,
                ),
                alignment: Alignment.topCenter,
                child: Icon(Icons.minimize, size: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
