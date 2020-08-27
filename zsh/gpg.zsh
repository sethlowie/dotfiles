function setupKeys() {
  gpg --full-generate-key;

  gpg --list-secret-keys --keyid-format LONG;
}

# Copy armor to clipboard and save the public key to git
function copyKey() {
  gpg --armor --export $1 | xclip -i -selection clipboard;
  git config --global user.signingkey $1;
}

