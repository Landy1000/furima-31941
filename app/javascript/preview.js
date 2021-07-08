document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list');

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

     // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute("class", "image-sample");
     // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };


    document.getElementById('item-image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      while(ImageList.firstChild){
        ImageList.removeChild(ImageList.firstChild)
      }

      if (e.target.files.length === 1){
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      }else{
        const fileLength = e.target.files.length;
        for (let i = 0; i < fileLength; i++) {
          const file = e.target.files[i];
          const blob = window.URL.createObjectURL(file);
          createImageHTML(blob);
        }
      }
    });
  }
});