alias merge_main='merge_main'

function merge_main(){
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git checkout main
  git pull
  git checkout $CURRENT_BRANCH
  git merge main
}
