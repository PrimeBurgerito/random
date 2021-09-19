import {getGods} from './api_smite';

const writeJson = <T>(o: T) => {
  const fs = require('fs');
  const json = JSON.stringify(o, null, 2);
  fs.writeFileSync(`${__dirname}/../data/gods.json`, json);
}

getGods().then((gods) => {
  writeJson(gods);
});
