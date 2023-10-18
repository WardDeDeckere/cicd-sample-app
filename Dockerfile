# Node.js version 18.x.x base image met alpine (lightweight)
FROM node:18-alpine

# working directory
WORKDIR /app

# cache installatie van dependencies, waardoor deze layer enkel gerebuild wordt bij wijziging in deze files
COPY package.json yarn.lock /app/

# installeer dependencies met yarn na check voor verandering
RUN yarn install --frozen-lockfile

# kopieer de rest van de applicatiefiles uit huidige directory van host naar app directory in docker container
COPY . /app/

# container luistert op poort 3000
EXPOSE 3000

# commando dat uitgevoerd wordt wanneer container start
CMD ["yarn", "start"]

#build container: docker build -t webapp .
#webapp = image, . = zoek dockerfile in huidige directory