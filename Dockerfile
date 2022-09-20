FROM node:15
WORKDIR /app
COPY package.json .
RUN npm install -f
COPY . ./ 
ENV REACT_APP_MOVIE_DB=9367e2a6
EXPOSE 3000
CMD ["npm","start"]