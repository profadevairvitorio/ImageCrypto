**ImageCrypto** is a Ruby-based encryption tool that uses an image and a secret key to generate a cryptographic key. It employs AES-256-CBC encryption to securely encrypt and decrypt messages.

## Features
- Derives a cryptographic key from an image and a secret key (stored in `.env`).
- Encrypts and decrypts messages using AES-256-CBC encryption.
- Uses Base64 encoding for handling image data.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/imagecrypto.git
   cd imagecrypto
2. Install dependencies:

    ```bash
    bundle install
3. Set up environment variables by creating a .env file in the root directory:
     ```bash
    SECRET_KEY=your_secret_key
