build:
	docker build . | tail -n1 | sed -E "s/^Successfully built //" > CID

run: build
	docker run --rm -it --name vxlan --net=host --privileged=true \
		-e VIP=192.168.11.1/24 \
		-e VNI=11 \
		-e NODES='192.168.11.1' \
		`cat CID`

tag: build
	docker tag -f `cat CID` s21g/vxlan:latest
	docker tag -f `cat CID` s21g/vxlan:`cat VERSION`

release: tag
	docker push s21g/vxlan:latest
	docker push s21g/vxlan:`cat VERSION`
