FROM debian:latest
LABEL maintainer="Abe Valle <me@abevalle.com>"
LABEL name="inventory-app"
LABEL version="latest"

ARG USERNNAME
ARG USERID

# Update and upgrade apt sources and applications
RUN apt-get update -y && \
    apt-get upgrade -y
# Install git curl ne
RUN apt-get install git wget ne zsh -y 
# Install Oh My ZSH
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ENV NVM_DIR /root/.nvm
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | zsh \
# Install node and npm via NVM
    &&. $NVM_DIR/nvm.sh \
    && nvm install node
CMD ["zsh"]