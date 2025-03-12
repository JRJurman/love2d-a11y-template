PROJECT_NAME="$1"

# Build the .love package (a .zip)
zip "$PROJECT_NAME.love" -r *.lua

# Run love.js on the project - this will create a new folder with the love.js assets
npx love.js "$PROJECT_NAME.love" "$PROJECT_NAME" -t "$PROJECT_NAME" -c

# Copy the template assets to the love.js project
cp index.js "$PROJECT_NAME/index.js" && cp template.html "$PROJECT_NAME/index.html"
