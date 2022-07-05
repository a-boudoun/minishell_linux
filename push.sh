make fclean
sleep 3
echo "this is what's been changed: "
git status
sleep 10
git diff
sleep 20
git add .
sleep 10
git commit -m "pushing from the script i made"
git push
