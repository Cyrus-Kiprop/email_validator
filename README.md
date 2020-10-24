[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
    <img src="images/microverse-logo.jpg" alt="Logo" width="80" height="80">

  <h3 align="center">A Valid Email Generator</h3>

  <p align="center">
    <br />
    <a href="https://https://pacific-stream-82359.herokuapp.com/">View Demo</a>
    ·
    <a href="https://github.com/Cyrus-Kiprop/email_validator/issues">Report Bug</a>
    ·
    <a href="https://github.com/Cyrus-Kiprop/email_validator/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
  - [Live Demo](#live-demo)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->

## About The Project

A ruby on Rails application that lets users find valid email addresses based on the contact’s name and url.

![](./images/entire-app.gif)

## Live Demo

Click [ here ](https://https://pacific-stream-82359.herokuapp.com/) for a live demo of the app.

### Built With

The project was built using the following languages stacks:

```sh
Back-End(server)
```

- [Ruby -v 2.7.1](https://ruby-doc.org/)
- [Ruby on Rails -v 5.2+](https://rubyonrails.org/)

```sh
Front-End(client)
```

- [Bootstrap v 4](https://getbootstrap.com)
- [ERB](https://guides.rubyonrails.org/layouts_and_rendering.html)
- [Sass](https://sass-lang.com/)
- [Font Awesome Icons](https://fontawesome.com/icons?d=gallery)

```sh
Testing Frameworks
```

- [Capybara](https://github.com/teamcapybara/capybara)
- [RSpec](https://rspec.info/)

<!-- GETTING STARTED -->

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby -v 2.7.2 -[click here](https://www.ruby-lang.org/en/)

- Rails -v 5.2.4

```sh
gem install rails -v 5.2.4
```

- Postgresql database [click here](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04)

### Installation

1. Clone the repo

```sh
git clone https://github.com/Cyrus-Kiprop/email_validator.git
```

2. CD into the project root directory

```sh
cd ./email_validator
```

3. Install Dependencies and gems

```sh
bundle install
```

4. Set the databases

```sh
rails db:create
```

5. Create database schemas

```sh
rails db:migrate
```

<!-- USAGE EXAMPLES -->

## Usage

### Fire up the server:

```JS
rails s
```

![](./images/starting-server.gif)

### Navigate to your browser and open port 3000:

```JS
http//localhost:3000
```

## Roadmap

See the [open issues](https://github.com/Cyrus-Kiprop/email_validator/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/NewAwesomeFeature`)
3. Commit your Changes (`git commit -m 'Add some NewAmazingFeature'`)
4. Push to the Branch (`git push origin feature/NewAmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->

## Contact

Cyrus Kiprop - cyruskiprop254@gmail.com

Project Link: [https://github.com/Cyrus-Kiprop/afriTrend](https://github.com/Cyrus-Kiprop/afriTrend)

## Authors

👤 **Cyrus Kiprop**

- Github: [Cyrus-Kiprop](https://github.com/Cyrus-Kiprop)
- Twitter: [@kipropJS](https://twitter.com/kipropJS)
- Linkedin: [Cyrus Kiprop](https://www.linkedin.com/in/cyrus-kiprop-ba7320120/)

## Acknowledgements

- [Heroku](https://afritrend.herokuapp.com)
- [Font Awesome](https://fontawesome.com)
- [Best-README-Template](https://github.com/othneildrew/Best-README-Template)

<!-- LICENSE -->

## License

Distributed under the MIT License. See [ LICENSE ](https://github.com/Cyrus-Kiprop/afriTrend/blob/master/LICENSE) for more information.

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/Cyrus-Kiprop/email_validator.svg?style=flat-square
[contributors-url]: https://github.com/Cyrus-Kiprop/email_validator/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Cyrus-Kiprop/email_validator.svg?style=flat-square
[forks-url]: https://github.com/Cyrus-Kiprop/email_validator/network/members
[stars-shield]: https://img.shields.io/github/stars/Cyrus-Kiprop/email_validator.svg?style=flat-square
[stars-url]: https://github.com/Cyrus-Kiprop/email_validator/stargazers
[issues-shield]: https://img.shields.io/github/issues/Cyrus-Kiprop/email_validator.svg?style=flat-square
[issues-url]: https://github.com/Cyrus-Kiprop/email_validator/issues
[product-screenshot]: /app/assets/images/screenshot.png
