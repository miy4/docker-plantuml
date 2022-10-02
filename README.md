# docker-plantuml

DISCONTINUED: The PlantUML project has released official Docker images on [GHCR](https://github.com/plantuml/plantuml/pkgs/container/plantuml) and [Docker Hub](https://hub.docker.com/r/plantuml/plantuml)

Docker container with Alpine Linux, Java and PlantUML.  
[PlantUML](http://plantuml.com/) is a Java program which generates UML diagrams from DSL-code.

## Installation

Pull from the Docker Hub:

```sh
$ docker pull miy4/plantuml
```

Build from source:

```sh
$ git clone https://github.com/miy4/docker-plantuml.git
$ cd docker-plantuml
$ docker build -t miy4/plantuml .
```

## Usage

```sh
$ docker run -v ${PWD}:/work -w /work --rm -t miy4/plantuml [PLANTUML OPTIONS and ARGUMENTS]
```

or

```sh
$ run-plantuml [PLANTUML OPTIONS and ARGUMENTS]
```

`docker run` and `run-plantuml` accept and pass a set of parameters to PlantUML CLI.  
See `docker run miy4/plantuml -h` or `run-plantuml -h` output for more details.

### Environment Variables

You can explicitly set the UID and GID of artifacts using the environment variables `PUML_UID` and `PUML_GID`.
In the following run example, PlantUML generates `sequence_diagram.png` owned by the user with UID 1000 and GID 1000.

``` sh
$ docker run -e PUML_UID=1000 -e PUML_GID=1000 -v ${PWD}:/work -w /work --rm -t miy4/plantuml -tpng sequence_diagram.uml
```

If you don't use `PUML_UID` and `PUML_GID`, PlantUML generates the files to have the same UID and GID as the owner of the working directory given by `-w`, `--workdir`.

## Example

```sh
$ run-plantuml -tpng -charset utf-8 sequence_diagram.uml
```

## License

MIT

