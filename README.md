# Gopad: Homebrew

[![Build Status](https://cloud.drone.io/api/badges/gopad/homebrew-gopad/status.svg)](https://cloud.drone.io/gopad/homebrew-gopad)
[![Join the Matrix chat at https://matrix.to/#/#gopad:matrix.org](https://img.shields.io/badge/matrix-%23gopad%3Amatrix.org-7bc9a4.svg)](https://matrix.to/#/#gopad:matrix.org)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/28a8333848cc4d85901b4f7281629665)](https://www.codacy.com/app/gopad/homebrew-gopad?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=gopad/homebrew-gopad&amp;utm_campaign=Badge_Grade)

**This project is under heavy development, it's not in a working state yet!**

Homebrew repository to install [Gopad](https://gopad.tech) on macOS.


## Prepare

```bash
brew tap gopad/gopad
```


## Install

### gopad-cli

```bash
brew install gopad-cli
gopad-cli -h
```


## Development

```
bundle install
bundle exec rake rubocop
bundle exec rake spec
```


## Security

If you find a security issue please contact gopad@webhippie.de first.


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)


## License

Apache-2.0


## Copyright

```
Copyright (c) 2018 Thomas Boerger <thomas@webhippie.de>
```
