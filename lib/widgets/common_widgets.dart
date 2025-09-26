
import 'package:ayurvedic/core/di/core_di.dart';
import 'package:ayurvedic/core/theme/app_theme.dart';
import 'package:ayurvedic/core/utils/utils.dart';
import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';
import 'package:ayurvedic/features/register/domain/entity/treatment_entity.dart';
import 'package:ayurvedic/features/register/logic/int_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

Column field({
  cntr,
  hint,
  txt,
  isThreeLine = false,
  isNum = false,
  isReq = true,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 5,
    children: [
      Text(
        txt,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppTheme.blackClr,
        ),
      ),
      TextFormField(
        maxLines: isThreeLine ? 3 : 1,
        controller: cntr,
        validator: isReq
            ? (val) {
                if (val!.isEmpty) {
                  return "*required !!";
                }
                return null;
              }
            : null,
        keyboardType: isNum ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          filled: true,
          fillColor: AppTheme.greyClr,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppTheme.borderClr),
          ),
          errorStyle: TextStyle(color: AppTheme.greenClr),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppTheme.borderClr),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppTheme.borderClr),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppTheme.borderClr),
          ),
        ),
      ),
    ],
  );
}

Widget readOnly({cntr, isTwoLine = false, ontap, txt, isReq = true, hint, ic}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 5,

    children: [
      Text(
        txt,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppTheme.blackClr,
        ),
      ),
      TextFormField(
        controller: cntr,
        readOnly: true,
        maxLines: isTwoLine ? 2 : 1,
        onTap: ontap,
        autocorrect: true,

        validator: isReq
            ? (val) {
                if (val!.isEmpty) {
                  return "*required !!";
                }
                return null;
              }
            : null,
        style: TextStyle(
          // fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),

        decoration: InputDecoration(
          errorStyle: const TextStyle(color: AppTheme.greenClr),
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          filled: true,
          fillColor: AppTheme.greyClr,

          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),

          suffixIcon: ic != null ? Icon(ic, color: AppTheme.greenClr) : null,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppTheme.borderClr),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppTheme.borderClr),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppTheme.borderClr),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppTheme.borderClr),
          ),
        ),
      ),
    ],
  );
}

Widget readOnlyRow({
  cntr,
  cntr2,

  isTwoLine = false,
  ontap,
  ontap2,

  txt,
  isReq = true,
  hint,
  hint2,

  ic,
  ic2,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 5,

    children: [
      Text(
        txt,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppTheme.blackClr,
        ),
      ),
      Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: cntr,
              readOnly: true,
              maxLines: isTwoLine ? 2 : 1,
              onTap: ontap,
              autocorrect: true,

              validator: isReq
                  ? (val) {
                      if (val!.isEmpty) {
                        return "*required !!";
                      }
                      return null;
                    }
                  : null,
              style: TextStyle(
                // fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),

              decoration: InputDecoration(
                errorStyle: const TextStyle(color: AppTheme.greenClr),
                hintText: hint,
                hintStyle: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                filled: true,
                fillColor: AppTheme.greyClr,

                labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),

                suffixIcon: ic != null
                    ? Icon(ic, color: AppTheme.greenClr)
                    : null,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.borderClr),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.borderClr),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.borderClr),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.borderClr),
                ),
              ),
            ),
          ),
          spaceWidth(10),

          Expanded(
            child: TextFormField(
              controller: cntr2,
              readOnly: true,
              maxLines: isTwoLine ? 2 : 1,
              onTap: ontap2,
              autocorrect: true,

              validator: isReq
                  ? (val) {
                      if (val!.isEmpty) {
                        return "*required !!";
                      }
                      return null;
                    }
                  : null,
              style: TextStyle(
                // fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),

              decoration: InputDecoration(
                errorStyle: const TextStyle(color: AppTheme.greenClr),
                hintText: hint2,
                hintStyle: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                filled: true,
                fillColor: AppTheme.greyClr,

                labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),

                suffixIcon: ic2 != null
                    ? Icon(ic2, color: AppTheme.greenClr)
                    : null,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.borderClr),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.borderClr),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.borderClr),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppTheme.borderClr),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

////////////////////// button ///////////////////

Widget normalBtn({txt, onpressed, size}) {
  return ElevatedButton(
    onPressed: onpressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: AppTheme.greenClr,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      fixedSize: size,
    ),
    child: Text(
      txt,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
    ),
  );
}

Widget icBtn({txt, onpressed, size, ic}) {
  return ElevatedButton.icon(
    onPressed: onpressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(121, 51, 166, 112),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      fixedSize: size,
    ),
    icon: Icon(ic),
    label: Text(
      txt,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
    ),
  );
}

loadingBtn({size}) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: AppTheme.greenClr,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      fixedSize: size,
    ),
    child: loading(clr: Colors.white),
  );
}

/////////////////////////////////////// branch ///////////////////////////////////////////////////////////////

Future<dynamic> branch(
  context, {
  txt,
  required List<BranchEntity> item,
  // required ontap,
  required TextEditingController cntr,
  required TextEditingController idCntr,
}) {
  // TextEditingController searchCntr = TextEditingController();
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt,
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.greenClr,
                  fontWeight: FontWeight.bold,
                ),
              ),

              spaceHeight(20),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: item.length,
                  itemBuilder: (_, index) {
                    var data = item[index];
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              cntr.text = data.name;
                              idCntr.text = data.id.toString();
                              navigatorKey.currentState!.pop();
                              // ontap();
                            },
                            dense: true,
                            title: Text(
                              data.name,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      navigatorKey.currentState!.pop();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      foregroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////// TREATMENT ///////////////////////////////////////////////////////////////

Future<dynamic> treatMent(
  context, {
  txt,
  required List<TreatmentEntity> item,

  required TextEditingController cntr,
  required TextEditingController idCntr,
}) {
  // TextEditingController searchCntr = TextEditingController();
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt,
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.greenClr,
                  fontWeight: FontWeight.bold,
                ),
              ),

              spaceHeight(20),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: item.length,
                  itemBuilder: (_, index) {
                    var data = item[index];
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              cntr.text = data.name;
                              idCntr.text = data.id.toString();
                              navigatorKey.currentState!.pop();
                            },
                            dense: true,
                            title: Text(
                              data.name,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      navigatorKey.currentState!.pop();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      foregroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////// date ////////////////////////////////////////////////
Future date(
  context, {
  required TextEditingController cntr,
  firstdate,
  lastdate,
  ontap,
}) async {
  var pickeddate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),

    firstDate: firstdate,
    lastDate: lastdate,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primaryContainer: AppTheme.greenClr,
            onPrimaryContainer: AppTheme.greenClr,
            primary: AppTheme.greenClr,
            onPrimary: AppTheme.greyClr,
            onSurface: Colors.black,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickeddate != null) {
    String formattedDate = DateFormat(
      'dd/MM/yyyy',
    ).format(pickeddate); // DateFormat('yyyy-MM-dd').format(pickeddate);
    cntr.text = formattedDate;
    ontap != null ? ontap() : null;
  }
}

/////////////////////////////////////////////////////////////////////////////

Future<void> pickMinute(
  BuildContext context,
  TextEditingController controller,
) async {
  int selectedMinute = 0;

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text("Select Minute"),
        content: BlocProvider(
          create: (context) => sl<IntCubit>(),
          child: BlocBuilder<IntCubit, int>(
            builder: (context, state) {
              return NumberPicker(
                value: state,
                minValue: 0,
                maxValue: 59,
                onChanged: (value) {
                  context.read<IntCubit>().update(value);
                  selectedMinute = value;
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.text = selectedMinute.toString().padLeft(2, '0');
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

Future<void> pickHour(
  BuildContext context,
  TextEditingController controller,
) async {
  int selectedHour = 0;

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text("Select Hour"),
        content: BlocProvider(
          create: (context) => sl<IntCubit>(),
          child: BlocBuilder<IntCubit, int>(
            builder: (context, state) {
              return NumberPicker(
                value: state,
                minValue: 0,
                maxValue: 23,
                onChanged: (value) {
                  context.read<IntCubit>().update(value);
                  selectedHour = value;
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.text = selectedHour.toString().padLeft(2, '0');
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

Future<dynamic> sheetNormal(
  context, {
  txt,
  required List<String> item,

  required TextEditingController cntr,
}) {
  // TextEditingController searchCntr = TextEditingController();
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt,
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.greenClr,
                  fontWeight: FontWeight.bold,
                ),
              ),

              spaceHeight(20),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: item.length,
                  itemBuilder: (_, index) {
                    var data = item[index];
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              cntr.text = data;

                              navigatorKey.currentState!.pop();
                            },
                            dense: true,
                            title: Text(
                              data,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey[200]),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      navigatorKey.currentState!.pop();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      foregroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
