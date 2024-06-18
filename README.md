An umbrella repository to submodule embulk-util-* librarires.

```
git submodule add -b main https://github.com/embulk/embulk-util-<type>.git
```

```
git submodule update --init --recursive --remote
git submodule foreach git fetch -p --tags origin
git submodule foreach git checkout main
git submodule foreach git rebase origin/main
git submodule foreach "git for-each-ref --format='%(refname:short)' refs/heads/ --merged=main | grep -v main | xargs --no-run-if-empty git branch -d"
```

```
git submodule foreach 'if [ "$name" != "embulk-util-rubytime" ] && [ "$name" != "embulk-util-timestamp" ]; then git checkout -b actions-macos-13; fi'
git submodule foreach 'if [ "$name" != "embulk-util-rubytime" ] && [ "$name" != "embulk-util-timestamp" ]; then sed -i -e "s/^        \- macOS-latest/        \- macos-13  # OpenJDK 8 is not supported on macos-14+ (M1)./" .github/workflows/check.yml; fi'
git submodule foreach 'if [ "$name" != "embulk-util-rubytime" ] && [ "$name" != "embulk-util-timestamp" ]; then git commit -a -m "Use macos-13 in GitHub Actions" || : ; fi'
git submodule foreach 'if [ "$name" != "embulk-util-rubytime" ] && [ "$name" != "embulk-util-timestamp" ] && [ "$name" != "embulk-filter-remove_columns" ] ; then git push -u origin actions-macos-13 || : ; fi'`
git submodule foreach 'if [ "$name" != "embulk-util-rubytime" ] && [ "$name" != "embulk-util-timestamp" ] ; then git checkout -b gradle-8.7 ; fi'
git submodule foreach 'if [ "$name" != "embulk-util-rubytime" ] && [ "$name" != "embulk-util-timestamp" ] ; then ./gradlew wrapper --gradle-version=8.7 ; fi'
git submodule foreach 'if [ "$name" != "embulk-util-rubytime" ] && [ "$name" != "embulk-util-timestamp" ] ; then git commit -a -m "Upgrade the Gradle wrapper to 8.7" || : ; fi'
git submodule foreach 'if [ "$name" != "embulk-util-rubytime" ] && [ "$name" != "embulk-util-timestamp" ] ; then git push -u origin gradle-8.7 || : ; fi'
```
