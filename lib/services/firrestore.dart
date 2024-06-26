import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //add a New user
  final CollectionReference users =
      FirebaseFirestore.instance.collection('user');

  Future<void> addUser(String email, String username, int imageNumber) {
    return users.add({
      'email': email,
      'username': username,
      'imageId': imageNumber,
    });
  }

  // get user by email
  Future<DocumentSnapshot> getUserByEmail(String email) {
    return users.where('email', isEqualTo: email).get().then((value) {
      return value.docs.first;
    });
  }

  // update username and imageNumber by email
  Future<void> updateUserData(String email, String username, int imageNumber) {
    return users.where('email', isEqualTo: email).get().then((value) {
      final docId = value.docs.first.id;
      return users.doc(docId).update({
        'username': username,
        'imageId': imageNumber,
      });
    });
  }


  // get imageNumber by email
  Future<int> getUserImageNumberByEmail(String email) {
    return users.where('email', isEqualTo: email).get().then((value) {
      return value.docs.first['imageId'];
    });
  }

//.....................................................................................................................................

  //add a New job
  final CollectionReference jobs =
      FirebaseFirestore.instance.collection('jobs');

  Future<void> addJob(String title, String description, int price, int slots,
      String address, String category, String contact, String ownerEmail) {
    return jobs.add({
      'title': title,
      'description': description,
      'price': price,
      'slots': slots,
      'address': address,
      'category': category,
      'contact': contact,
      'ownerEmail': ownerEmail,
      'EnrolledList': [],
      'createdAt': Timestamp.now(),
    });
  }

// enroll user to a job
  void enrollUser(String jobId, String userEmail) {
    jobs.doc(jobId).update({
      'EnrolledList': FieldValue.arrayUnion([
        {'email': userEmail, 'status': 'pending'}
      ]),
    });
  }

  // fetch all jobs
  Stream<QuerySnapshot> getJobs() {
    final jobsStream = jobs.orderBy('createdAt', descending: true).snapshots();

    return jobsStream;
  }

  // fetch my ads
  Stream<QuerySnapshot> getMyAds(String ownerEmail) {
    final jobsStream1 =
        jobs.where('ownerEmail', isEqualTo: ownerEmail).snapshots();

    return jobsStream1;
  }

  // fetch job by id
  Future<DocumentSnapshot> getJobById(String documentId) {
    return jobs.doc(documentId).get();
  }

// fetch enrolled approved status user count for a job
  Future<int> getApprovedEnrolledCount(String jobId) {
    return jobs.doc(jobId).get().then((value) {
      final enrolledList = value['EnrolledList'];
      int count = 0;
      for (final user in enrolledList) {
        if (user['status'] == 'Approved') {
          count++;
        }
      }
      return count;
    });
  }

  //delete a job
  Future<void> deleteJob(String documentId) {
    return jobs.doc(documentId).delete();
  }

  // fetch the enrolled list for a job
  Future<List> getEnrolledList(String jobId) {
    return jobs.doc(jobId).get().then((value) {
      return value['EnrolledList'];
    });
  }

  // delete enrolled user from a job
  Future<void> deleteEnrolledUser(String jobId, String userEmail) {
    return jobs.doc(jobId).get().then((doc) {
      List enrolledList = List.from(doc['EnrolledList']);
      enrolledList.removeWhere((user) => user['email'] == userEmail);
      return jobs.doc(jobId).update({'EnrolledList': enrolledList});
    });
  }



  // update enrolled user status using jobId and userEmail
  Future<void> updateEnrolledUserStatus(
      String jobId, String userEmail, String newStatus) {
    return jobs.doc(jobId).get().then((doc) {
      List enrolledList = List.from(doc['EnrolledList']);
      for (var user in enrolledList) {
        if (user['email'] == userEmail) {
          user['status'] = newStatus;
          break;
        }
      }
      return jobs.doc(jobId).update({'EnrolledList': enrolledList});
    });
  }
}
