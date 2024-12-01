from ubuntu:latest

env PATH=$PATH:/usr/games:/usr/bin

run apt-get update -y && \
    apt install -y fortune cowsay bash git coreutils netcat-traditional netcat-openbsd && \
    git clone https://github.com/6288mani/wisecow.git /app/wisecow && \
    chmod 755 /app/wisecow/wisecow.sh && \
    echo '#!/bin/bash\nexport PATH=$PATH:/usr/games:/usr/bin\nsleep 5\n/app/wisecow/wisecow.sh' > /app/wisecow/main.sh && \
    chmod 100 /app/wisecow/main.sh && \
    rm -rf /var/lib/apt/lists/*

expose 4499

cmd ["/app/wisecow/main.sh"]
