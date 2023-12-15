#!/bin/bash
set -o allexport; source .release.env; set +o allexport
echo "📦 create release: $TAG $MESSAGE"

tinygo build -scheduler=none --no-debug \
-o hello-world.wasm \
-target wasi main.go

find . -name '.DS_Store' -type f -delete

git add .
git commit -m "📦 ${MESSAGE}"

git tag -a ${TAG} -m "${MESSAGE}"
git push origin ${TAG}

gh release create ${TAG} ./hello-world.wasm
