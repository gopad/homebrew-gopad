# Gopad: Homebrew

[![General Workflow](https://github.com/gopad/homebrew-gopad/actions/workflows/general.yml/badge.svg)](https://github.com/gopad/homebrew-gopad/actions/workflows/general.yml) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/c4d3d70805a4483cbc5cb7920a230f88)](https://www.codacy.com/gh/gopad/homebrew-gopad/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=gopad/homebrew-gopad&amp;utm_campaign=Badge_Grade) [![Join the Matrix chat at https://matrix.to/#/#gopad:matrix.org](https://img.shields.io/badge/matrix-%23gopad%3Amatrix.org-7bc9a4.svg)](https://matrix.to/#/#gopad:matrix.org)

Homebrew repository to install [Gopad](https://gopad.eu) on macOS.

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

*   [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2018 Thomas Boerger <thomas@webhippie.de>
```
