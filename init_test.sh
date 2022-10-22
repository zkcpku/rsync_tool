rm -r from/
rm -r to/
mkdir from/
mkdir to/

touch from/1.txt
touch from/1.log
touch from/1.py

touch from/.gitignore
echo "*.log" > from/.gitignore

mkdir from/1

touch from/1/1.txt
touch from/1/1.log
touch from/1/1.py

touch to/2.txt
touch to/2.log
touch to/2.py
echo "*.txt" > to/.gitignore

cd from/
git init