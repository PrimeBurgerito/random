import { SmiteGod, SmiteSession } from './smite_domain';
import axios from 'axios';
import { DateTime } from 'luxon';
import md5 from 'md5';

const smiteDevId = 3006;
const smiteAuthKey = '228D2406703F4AF28EF9B71CD6398995';
const smiteUrl = 'https://api.smitegame.com/smiteapi.svc';
const dateFormat = 'yyyyMMddHHmmss'

const createTimeStamp = (): string => DateTime.now().toUTC().toFormat(dateFormat);

const createSignature = (method: string, timestamp: string): string => {
  const input = `${smiteDevId}${method}${smiteAuthKey}${timestamp}`;
  return md5(input);
}

const getSession = async (): Promise<SmiteSession> => {
  console.log('## Creating smite session...');
  const timeStamp = createTimeStamp();
  const signature = createSignature('createsession', timeStamp);
  const url = `${smiteUrl}/createsessionJson/${smiteDevId}/${signature}/${timeStamp}`;
  const response = await axios.get<SmiteSession>(url);
  if (response.status === 200) {
    console.log('Session created successfully:');
    console.log(JSON.stringify(response.data, null, 2));
  } else {
    console.error(response);
  }
  return response.data;
}

export const getGods = async (): Promise<SmiteGod[]> => {
  const session = await getSession();
  console.log('## Finding gods...');
  const timeStamp = createTimeStamp();
  const signature = createSignature('getgods', timeStamp);
  const url = `${smiteUrl}/getgodsJson/${smiteDevId}/${signature}/${session.session_id}/${timeStamp}/1`;
  const response = await axios.get<SmiteGod[]>(url);
  if (response.status === 200) {
    console.log('Gods found.')
  } else {
    console.error(response);
  }
  return response.data;
}
