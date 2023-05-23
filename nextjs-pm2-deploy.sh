echo "Deploy starting..."

npm ci --legacy-peer-deps

BUILD_DIR=temp npm run build --if-present || exit

if [! -d "temp"]:then
    echo '\033[31m temp Directory not exists!\033[0m'
    exit 1;
fi

rm -rf .next

mv temp .next

pm2 reload example --update-env

echo "Deploy done."



