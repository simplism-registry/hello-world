# hello-world

> Add Extism dependency
```bash
go get github.com/extism/go-pdk
```

> Build the wasm plug-in:
```bash
tinygo build -scheduler=none --no-debug \
-o hello-world.wasm \
-target wasi main.go
```

> Serve the wasm plug-in with Simplism:
```bash
simplism listen \
hello-world.wasm handle --http-port 8080 --log-level info
```

> Query the wasm plug-in:
```bash
curl http://localhost:8080/hello/world \
-H 'content-type: application/json; charset=utf-8' \
-d '{"firstName":"Bob","lastName":"Morane"}'
```

## Download a release of hello-world.wasm

```bash
ORGANISATION="simplism-registry"
PROJECT="hello-world"
WASM_FILE="${PROJECT}.wasm"
VERSION="0.0.1"

wget https://github.com/${ORGANISATION}/${PROJECT}/releases/download/v${VERSION}/${WASM_FILE} -O ${WASM_FILE}
```

## Start a remote Simplism service from an URL

```bash
ORGANISATION="simplism-registry"
PROJECT="hello-world"
WASM_FILE="${PROJECT}.wasm"
VERSION="0.0.1"

simplism listen \
hello-world.wasm handle --http-port 8080 --log-level info \
--wasm-url https://github.com/${ORGANISATION}/${PROJECT}/releases/download/v${VERSION}/${WASM_FILE}
```