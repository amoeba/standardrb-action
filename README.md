# StandardRB Action

Lint your Ruby code in parallel to your builds with [StandardRB](https://github.com/testdouble/standard).
Based almost entirely off the [Rubucop Action](https://github.com/gimenete/rubocop-action) by [Alberto Gimeno](https://github.com/gimenete).

![](docs/images/screenshot.png)

## Example usage

Here's an example running a build matrix and StandardRB:

```yml
name: CI

on: [push]

jobs:
  Build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        ruby: [ '2.5', '2.6', '2.7' ]
    steps:
    - uses: actions/checkout@v2
    - name: Set up Ruby ${{matrix.ruby}}
      uses: actions/setup-ruby@v1
      with:
        ruby-version: ${{matrix.ruby}}
    - name: Build and test with Rake
      run: |
        gem install bundler
        bundle install --jobs 4 --retry 3
        bundle exec rake
  StandardRB:
    runs-on: ubuntu-latest
    steps:
      - name: standardrb
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        uses: amoeba/standardrb-action@v2
```

You can specify a project path if your application is not at the root of the
repository:

```
- name: standardrb
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    PROJECT_PATH: my_rails_app/
  uses: amoeba/standardrb-action@v2
```

## Contributing

Please file an [Issue](https://github.com/amoeba/standardrb-action) for bug reports, feature requests, or other comments.
