cd ../
sh containthedocs-build.sh
cd docker/
tar czf partnerlabs.tar.gz ~/git/partnerlabs/docs/_build/html/
sudo docker build -t str1ngerbell/partnerlabs:latest .
sudo docker stop partnerlabs
sudo docker run -it --rm -d -p 80:80 --name partnerlabs str1ngerbell/partnerlabs:latest
read -p "Push the new docker image? (y/[n]): " PUSH
PUSH=${PUSH:-n}
if [ $PUSH = 'y' ]
then
    sudo docker push str1ngerbell/partnerlabs:latest
fi