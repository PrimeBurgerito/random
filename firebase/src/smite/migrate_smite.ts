// Import Admin SDK
import admin from 'firebase-admin';
import { getGods } from './api_smite';
import { SmiteGod } from './smite_domain';

// Get a database reference to our blog
const writeGods = async (): Promise<void> => {
  const serviceAccount = require(`${__dirname}/../../data/serviceAccount.json`);

  const app = admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: 'https://random-53b6e-default-rtdb.europe-west1.firebasedatabase.app'
  });
  const db = app.database();
  const ref = db.ref('random/game/smite');
  const godRef = ref.child('god');

  const gods = await getGods();

  const godObject = gods.reduce<Record<string, SmiteGod>>((all, prev) => {
    return { ...all, [prev.Name]: prev };
  }, {});

  const saveResponse = await godRef.set(godObject)
  console.log(saveResponse);
};

void writeGods();
