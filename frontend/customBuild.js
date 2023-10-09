const fs = require('fs');
const path = require('path');

const imageFolder = './public/images/OASIS'; // 画像ファイルが保存されているフォルダへのパス
const outputFilePath = './src/imageFileNames.json'; // リストを保存する場所のパス

function saveImageFileNames() {
  fs.promises.readdir(imageFolder)
    .then(files => {
      const imageFileNames = files
        .filter(file => {
          const extname = path.extname(file).toLowerCase();
          return ['.jpg', '.jpeg', '.png', '.gif'].includes(extname); // 画像ファイルの拡張子を指定
        })
        .map(file => path.basename(file)); // ファイル名のみを取得

      // ファイル名をファイルに保存
      fs.promises.writeFile(outputFilePath, JSON.stringify(imageFileNames, null, 2), 'utf-8')
        .then(() => {
          console.log('画像ファイル名が保存されました:', imageFileNames);
        })
        .catch(error => {
          console.error('ファイルを保存する際にエラーが発生しました:', error);
        });
    })
    .catch(error => {
      console.error('フォルダを読み込む際にエラーが発生しました:', error);
    });
}

saveImageFileNames();
