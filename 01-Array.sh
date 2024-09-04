#!\bin\bash
# index starts from 0 and size of the array is 3
FRUITS=("APPLE" "KIWI" "ORANGE")
echo "first fruit is: ${FRUITS[0]}"
echo "second fruit is : ${FRUITS[1]}"
echo "Third fruit is : ${FRUITS[2]}"
echo "All fruit are : ${FRUITS[@]}"