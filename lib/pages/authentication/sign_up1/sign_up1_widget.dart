import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:trade_mirror/flutter_flow/flutter_flow_model.dart';
import 'package:trade_mirror/flutter_flow/flutter_flow_util.dart';
import 'package:trade_mirror/pages/authentication/sign_up2/sign_up2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'sign_up1_model.dart';

class SignUp1Widget extends StatefulWidget {
  const SignUp1Widget({super.key});

  @override
  State<SignUp1Widget> createState() => _SignUp1WidgetState();
}

class _SignUp1WidgetState extends State<SignUp1Widget> {
  late SignUp1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUp1Model());

    _model.mobileNumberTextController ??= TextEditingController();
    _model.mobileNumberFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    final mobileNumber = _model.mobileNumberTextController?.text ?? "";
    final uniqueUsername = 'user_$mobileNumber';

    final url = Uri.parse('https://trademirror.onrender.com/user_register');
    final headers = {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    };
    final body = jsonEncode({
      "username": uniqueUsername,
      "full_name": "Default Name",
      "date_of_birth": "1990-01-01",
      "email": "default@example.com",
      "password": "defaultPassword",
      "regis_date": DateTime.now().toIso8601String(),
      "aadhar": "defaultAadhar",
      "mobile": mobileNumber,
      "status": true,
      "subscription_payment": false,
      "broker_account": "defaultBrokerAccount",
      "copied_traders": [],
      "subscription_plan": "defaultPlan",
      "Angel_Orders_Data": [],
      "Dhan_Orders_Data": [],
      "Zerodha_Orders_Data": [],
      "Upstox_Orders_Data": [],
      "paper_trading_balance": 0,
      "watchlist": [],
      "referred_by": "",
      "referred_users": [],
      "referral_rewards": 0,
      "amount_deposited": 0,
      "broker_acc_api": "defaultAPI",
      "access_token": "",
      "client_id": "",
      "Angel_client_id": "",
      "Angel_api_key": "",
      "Angel_auth_token": "",
      "Angel_username": "",
      "Angel_secret_key": "",
      "Angel_MPIN": "",
      "upstox_access_token": "",
      "upstox_api_key": "",
      "upstox_api_secret": "",
      "kite_access_token": "",
      "kite_api_key": "",
      "subscription_start_date": DateTime.now().toIso8601String(),
      "subscription_end_date": DateTime.now().add(Duration(days: 365)).toIso8601String(),
      "subscription_payment_status": false
    });

      try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // Handle successful response
        print('User registered successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUp2Widget(), 
          ),
        );
      } else {
        // Handle error response
        print('Failed to register user: ${response.body}');
        // Show an error message
      }
    } catch (e) {
      print('Error: $e');
      // Show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).accent1,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 35.0),
                            child: Text(
                              'Sign up to copytrading',
                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                    fontFamily: 'Akshar',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 10.0),
                          child: TextFormField(
                            controller: _model.mobileNumberTextController,
                            focusNode: _model.mobileNumberFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                              hintText: 'Enter your mobile no.',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFABABAB),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.mobileNumberTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 8.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: _registerUser,
                            text: 'Sign up',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.85,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).tertiary,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDFDFDF),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'or via',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDFDFDF),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F6F8),
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color: Color(0xFF1778F2),
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F6F8),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 10.0,
                                    height: 10.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/google.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F6F8),
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.apple,
                                    color: Color(0xFF131313),
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Do have an account ? ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                TextSpan(
                                  text: 'Login',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
