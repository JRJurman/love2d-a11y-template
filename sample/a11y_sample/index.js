const { app, BrowserWindow, protocol } = require('electron');
const path = require('path');
const fs = require('fs');

const PUBLIC_DIR = path.join(__dirname);

// Register `app://` as a privileged scheme
protocol.registerSchemesAsPrivileged([
    {
        scheme: 'app',
        privileges: {
            standard: true, // Allows fetch(), XMLHttpRequest, and WebAssembly
            secure: true,   // Treated as a secure origin (like HTTPS)
            supportFetchAPI: true, // Enables Fetch API for app://
            corsEnabled: true // Allows cross-origin requests (important for some assets)
        }
    }
]);

app.whenReady().then(() => {
    // Register a custom protocol that handles different content types
    protocol.handle('app', async (request) => {
        // Extract file path correctly
        let urlPath = new URL(request.url).pathname;
        urlPath = decodeURIComponent(urlPath); // Handle encoded characters (e.g., spaces)
        if (urlPath === '/') urlPath = '/index.html'; // Default to index.html

        let filePath = path.join(PUBLIC_DIR, urlPath);

        try {
            return new Response(fs.readFileSync(filePath), {
                headers: { 'Content-Type': getMimeType(filePath) }
            });
        } catch (err) {
            console.error(`File not found: ${filePath}`);
            return new Response('File Not Found', { status: 404 });
        }
    });

    // Create the browser window
    const mainWindow = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            nodeIntegration: false,
            contextIsolation: true,
        }
    });

    // Load the app using our custom protocol
    mainWindow.loadURL('app:///index.html');
});

// Helper function to determine MIME types
function getMimeType(filePath) {
    const ext = path.extname(filePath).toLowerCase();
    const mimeTypes = {
        '.html': 'text/html',
        '.js': 'text/javascript',
        '.css': 'text/css',
        '.json': 'application/json',
        '.png': 'image/png',
        '.jpg': 'image/jpeg',
        '.gif': 'image/gif',
        '.svg': 'image/svg+xml',
        '.wav': 'audio/wav',
        '.mp4': 'video/mp4',
        '.woff': 'application/font-woff',
        '.ttf': 'application/font-ttf',
        '.eot': 'application/vnd.ms-fontobject',
        '.otf': 'application/font-otf',
        '.wasm': 'application/wasm'
    };
    return mimeTypes[ext] || 'application/octet-stream';
}
