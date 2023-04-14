// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SportsInterestState extends Equatable {
  final List<Map<String, String>> interests;
  final List<Map<String, String>> selectedInterests;
  const SportsInterestState({
    required this.interests,
    required this.selectedInterests,
  });

  SportsInterestState copyWith({
    List<Map<String, String>>? interests,
    List<Map<String, String>>? selectedInterests,
  }) {
    return SportsInterestState(
      interests: interests ?? this.interests,
      selectedInterests: selectedInterests ?? this.selectedInterests,
    );
  }

  factory SportsInterestState.initial() {
    return const SportsInterestState(
      interests: [],
      selectedInterests: [],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [interests, selectedInterests];
}

final sportsInterestControllerProvider =
    StateNotifierProvider<SportsInterestController, SportsInterestState>(
        (ref) => SportsInterestController(ref)..fetchInterests());

class SportsInterestController extends StateNotifier<SportsInterestState> {
  SportsInterestController(this.ref) : super(SportsInterestState.initial());
  final Ref ref;

  final List<Map<String, String>> sportsInterest = [];
  final List<Map<String, String>> selectedInterests = [];

  final CollectionReference interestsCollection =
      FirebaseFirestore.instance.collection('interests');

  Future<void> fetchInterests() async {
    DocumentSnapshot interestsSnapshot =
        await interestsCollection.doc('sports').get();

    final interests = interestsSnapshot.data();
    // extract a list of {name: 'Cricket'} from the object interests
    if (interests != null) {
      final castedInterest = interests as Map<String, dynamic>;
      List<dynamic> recastedInterests =
          castedInterest['interests'] as List<dynamic>;
      interests.clear();
      for (var interest in recastedInterests) {
        Map<String, String> interestMap = {
          'name': interest['name'] as String,
        };

        sportsInterest.add(interestMap);
      }
      state = state.copyWith(interests: sportsInterest);
      log(sportsInterest.length.toString());
    }
  }

  void addInterestToSelectedInterests(Map<String, String> interest) {
    //check if the interest is already selected
    if (selectedInterests.contains(interest)) {
      // remove the interest from the list
      selectedInterests.remove(interest);
    } else {
      // add the interest to the list
      selectedInterests.add(interest);
    }
    state = state.copyWith(selectedInterests: selectedInterests);
  }

  Future<void> saveSelectedInterests() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('user_interests').doc(uid).set({
      'interests': selectedInterests,
    });
  }

  Future<void> getUserSelectedSportsInterest() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('user_interests')
        .doc(uid)
        .get()
        .then((value) {
      final interests = value.data();
      // extract a list of {name: 'Cricket'} from the object interests
      if (interests != null) {
        final castedInterest = interests as Map<String, dynamic>;
        List<dynamic> recastedInterests =
            castedInterest['interests'] as List<dynamic>;
        interests.clear();
        for (var interest in recastedInterests) {
          Map<String, String> interestMap = {
            'name': interest['name'] as String,
          };

          selectedInterests.add(interestMap);
        }
        state = state.copyWith(selectedInterests: selectedInterests);
        log(selectedInterests.length.toString());
      }
    });
  }
}
