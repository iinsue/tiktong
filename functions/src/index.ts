/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */
import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const onVideoCreated = functions.firestore.onDocumentCreated(
  {
    document: "videos/{videoId}",
    region: "asia-northeast3",
  },
  async (event) => {
    // snapshot은 방금 만들어진 영상을 의미
    const snapshot = event.data;
    if (!snapshot) return;

    await snapshot.ref.update({ hello: "from functions" });
  }
);
