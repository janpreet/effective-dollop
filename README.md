# Effective-Dollop

![build-resume](https://github.com/janpreet/effective-dollop/workflows/build-resume/badge.svg)

# Codified Resume Builder

This repository contains a containerized LaTeX resume builder, allowing for version-controlled, easily updatable, and consistently formatted resumes.

## Features

- LaTeX-based resume template
- Makefile for easy PDF and RTF generation
- Git-ignored personal information for privacy

## Prerequisites

- Docker
- Make
- Git

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/janpreet/codified-resume.git
   cd codified-resume
   ```

2. Edit the `janpreet-singh-resume.tex` file with your information.


3. Generate the PDF resume:
   ```bash
   make run-pdf
   ```

4. Generate the RTF version:
   ```bash
   make run-rtf
   ```

5. Generate both PDF and RTF versions:
   ```bash
   make run
   ```

6. Clean up auxiliary files:
   ```bash
   make clean
   ```

## Customization

Feel free to modify the LaTeX template, or Makefile to suit your needs. The main files are:

- `janpreet-singh-resume.tex`: The LaTeX resume template
- `Makefile`: Contains commands for running the container

## Privacy

The repository is set up to ignore personal information. Make sure to update the `.gitignore` file if you add any files containing sensitive data.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the [MIT License](LICENSE).
