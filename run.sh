wget https://raw.githubusercontent.com/star574/freenom/main/.env.example
cp .env.example .env
echo -e "FREENOM_PASSWORD='${{secrets.PASSWORD}}'\nFREENOM_USERNAME='${{secrets.USERNAME}}'" >> .env  
cat .env | grep USERNAME
docker run -d --name freenom  -v $(pwd):/conf -v $(pwd)/logs:/app/logs luolongfei/freenom
sleep 10s
docker logs freenom