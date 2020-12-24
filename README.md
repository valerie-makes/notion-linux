# Notion for Ubuntu/Debian

Build Notion packages for Ubuntu/Debian, using resources extracted from Notion's Windows installer.

## Download the latest pre-built package

- [Download the latest package for AMD64 (most systems)](https://github.com/davidbailey00/notion-deb-builder/releases/download/v2.0.11-e11.1.1/notion-desktop_2.0.11_amd64.deb)
- [Download the latest package for ARM64](https://github.com/davidbailey00/notion-deb-builder/releases/download/v2.0.11-e11.1.1/notion-desktop_2.0.11_arm64.deb)
- [See all releases](https://github.com/davidbailey00/notion-deb-builder/releases)

## Requirements

1. Install Node.js, e.g. using NVM:

   ```sh
   nvm install node
   ```

   You can also use your system package manager, although this may not install the latest version.

2. Install other packages required for building the app.

   Using Ubuntu or Debian with `apt`:

   ```sh
   sudo apt install p7zip-full imagemagick fakeroot make g++
   ```

   **Note:** p7zip needs to be version 16 or newer, which is not available in Ubuntu 16.04 or Debian 8. Please upgrade to at least Ubuntu 18.04 or Debian 9, or manually install the latest version of p7zip.

   Or, using macOS with `brew` or `port`:

   ```sh
   # with Homebrew: (https://brew.sh/)
   brew install p7zip imagemagick fakeroot dpkg

   # with MacPorts: (https://www.macports.org/)
   sudo port install p7zip imagemagick fakeroot dpkg
   ```

## Build

Run the build script:

```sh
./build.sh
```

To produce an ARM64 build, run the following:

```sh
./build.sh arm64 arm64
```

Once complete, you should have a DEB package in the `out` directory.

## FAQ

### Google/Apple Login doesn't work; what can I do?

Google/Apple login is not supported. You can [login using your email address instead](https://github.com/davidbailey00/notion-deb-builder/issues/13#issuecomment-719966960), making sure to use the same email as your Google Account or Apple ID.
