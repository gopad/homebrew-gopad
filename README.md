# Gopad: Homebrew

[![General Workflow](https://github.com/gopad/homebrew-gopad/actions/workflows/general.yml/badge.svg)](https://github.com/gopad/homebrew-gopad/actions/workflows/general.yml) [![Join the Matrix chat at https://matrix.to/#/#gopad:matrix.org](https://img.shields.io/badge/matrix-%23gopad%3Amatrix.org-7bc9a4.svg)](https://matrix.to/#/#gopad:matrix.org) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/c4d3d70805a4483cbc5cb7920a230f88)](https://app.codacy.com/gh/gopad/homebrew-gopad/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

Homebrew repository to install [Gopad](https://gopad.eu) on macOS.

## Prepare

```console
brew tap gopad/gopad
```

## Install

### [gopad-api](https://github.com/gopad/gopad-api)

```console
brew install gopad-api
gopad-api -h
```

### [gopad-cli](https://github.com/gopad/gopad-cli)

```console
brew install gopad-cli
gopad-cli -h
```

## Development

```console
bundle install
bundle exec rake rubocop
bundle exec rake spec
```

## Security

If you find a security issue please contact
[gopad@webhippie.de](mailto:gopad@webhippie.de) first.

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

-   [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2018 Thomas Boerger <thomas@webhippie.de>
```
