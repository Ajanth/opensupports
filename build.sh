echo "1/4 Installing and Building frontend..."
cd client
npm install
npm rebuild node-sass
npm run build
rm build/index.html
echo "2/4 Installing composer dependencies"
cd ../server
composer install
echo "3/4 Creating api folder..."
echo -n > config.php
mkdir files2
cp files/.htaccess files2
cd ..
mkdir api
mkdir api/files
cp server/index.php api
cp server/.htaccess api
cp server/composer.json api
cp server/composer.lock api
cp -a server/controllers api
cp -a server/data api
cp -a server/libs api
cp -a server/models api
cp -a server/vendor api
cp -a server/files2/. api/files
rm -rf server/files2
cp server/config.php api
chmod -R 755 .
cp client/src/index.php client/build
echo "4/4 Generating zip..."
cd client/build
zip opensupports_dev.zip index.php
zip -u opensupports_dev.zip .htaccess
zip -u opensupports_dev.zip bundle.js
zip -ur opensupports_dev.zip images
mv opensupports_dev.zip ../..
cd ../..
zip -ur opensupports_dev.zip api
mkdir dist
mv opensupports_dev.zip dist
