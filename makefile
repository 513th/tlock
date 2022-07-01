SHELL := /bin/bash

# ==============================================================================
# Local support

build:
	go build cmd/tle.go

run-encrypt:
	go run cmd/tle.go -n="http://pl-us.testnet.drand.sh/" -c="7672797f548f3f4748ac4bf3352fc6c6b6468c9ad40ad456a397545c6e2df5bf" -D=5s -o=encryptedFile test.pdf

run-encrypt-r:
	go run cmd/tle.go -n="http://pl-us.testnet.drand.sh/" -c="7672797f548f3f4748ac4bf3352fc6c6b6468c9ad40ad456a397545c6e2df5bf" -r=2000000 -o=encryptedFile test.pdf

run-decrypt:
	go run cmd/tle.go -d -n="http://pl-us.testnet.drand.sh/" -o=decryptedFile.pdf encryptedFile

run-encrypt-a:
	go run cmd/tle.go -a -n="http://pl-us.testnet.drand.sh/" -c="7672797f548f3f4748ac4bf3352fc6c6b6468c9ad40ad456a397545c6e2df5bf" -D=5s -o=encryptedArmor.pem test.pdf

run-decrypt-a:
	go run cmd/tle.go -d -n="http://pl-us.testnet.drand.sh/" -o=decryptedArmor.pem encryptedArmor.pem


# ==============================================================================
# Modules support

tidy:
	go mod tidy

deps-upgrade:
	go get -u -v ./...
	go mod tidy
	go mod vendor