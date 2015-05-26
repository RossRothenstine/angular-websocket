@ECHO OFF
REM Create Distribution directory
IF NOT EXIST "dist" MKDIR "dist"

echo "* Copy files"
COPY src\angular-websocket.js dist\angular-websocket.js
COPY src\angular-websocket-mock.js dist\angular-websocket-mock.js

ECHO "dist\angular-websocket.js"
ECHO "dist\angular-websocket-mock.js"

IF EXIST ".\node_modules\.bin\uglifyjs.cmd" (
  ECHO "* Build source files"
  .\node_modules\.bin\uglifyjs ^
    --source-map dist/angular-websocket.min.js.map ^
    --source-map-url angular-websocket.min.js.map ^
    --mangle ^
    --compress ^
    --stats ^
    src\angular-websocket.js > dist\angular-websocket.min.js 
    
    XCOPY dist\* .

    echo "Copy dist to root"
) ELSE (
  ECHO "UglifyJS not found in .\node_modules\.bin"
)