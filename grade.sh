CPATH=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

mkdir student-submission
git clone $1 student-submission
echo "Finished cloning"


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

cp student-submission/*.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area
cp Server.java grading-area
cp GradeServer.java grading-area

cd grading-area

if ! [ -f ListExamples.java ]
then 
    echo "Missing file ListExamples.java"
    echo "Score is 0"
    exit
else 
    echo "File exists"
fi 

javac -cp $CPATH *.java &> compile.txt
if [ $? -ne 0 ]
then 
    echo "Compile Error"
    echo "Score 0"
    exit
else 
    echo "Compile successful"
fi

