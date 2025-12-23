# 가장 최신 버전의 Nginx 이미지 사용
FROM nginx:latest

# 로컬 경로 /source/nginx.conf 파일을 컨테이너의 Nginx 설정 경로에 복사
COPY source/nginx.conf /etc/nginx/nginx.conf

# Nginx의 /source/index.html 파일을 /usr/share/nginx/html/index.html 에 복사
COPY source/index.html /usr/share/nginx/html/index.html

# 컨테이너가 사용하는 포트 번호 공개, 실제포트를 여는 것은 아니므로 실행에 영향을 주지 않음
EXPOSE 80

# 컨테이너가 실행될 때 Nginx를 포그라운드 모드로 실행, daemon off를 써서 백그라운드 모드로 실행되지 않게 함
CMD ["nginx", "-g", "daemon off;"]
