import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meows_co/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../extension/extensions.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

part 'auth_services.dart';
part 'user_services.dart';
part 'post_services.dart';
part 'auth_api_services.dart';
part 'custom_interceptor.dart';

const String urlApi = "http://192.168.43.136:8000/api/";