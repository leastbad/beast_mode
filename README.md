# Beast Mode StimulusReflex

A server-side rendered faceted search UI demo featuring [StimulusReflex](https://docs.stimulusreflex.com) and [All Futures](https://github.com/leastbad/all_futures).

## Installation

1. bundle install
2. yarn install
3. bin/setup

Make sure that if you *don't* run `bin/setup` that you run `rake db:seed` manually.

## Dependencies

Make sure that your Postgres and Redis settings are configured via the `REDIS_URL` environment variable.

## Docker

You can also run the entire application and its dependencies with Docker.

```sh
git clone https://github.com/leastbad/beast_mode.git
cd beast_mode
bin/docker/up
```

*NOTE: You may need to run `bin/docker/up` more than once on initial boot*

### Docker binstubs

- `bin/docker/up` - starts the entire containerized environment
- `bin/docker/down` - stops all services and removes containers, networks, volumes, and images
- `bin/docker/start` - starts stopped containers

    ```sh
    bin/docker/start
    bin/docker/start web
    bin/docker/start webpack
    ```

- `bin/docker/stop` - stops containers without removing them

    ```sh
    bin/docker/stop
    bin/docker/stop web
    bin/docker/stop webpack
    ```

- `bin/docker/restart` - restarts containers

    ```sh
    bin/docker/restart
    bin/docker/restart web
    bin/docker/restart webpack
    ```

- `bin/docker/attach` - attach to container, _useful for debugging with pry and byebug_

    ```sh
    bin/docker/attach web
    bin/docker/attach webpack
    <CTRL-P><CTRL-Q>
    ```

- `bin/docker/exec` - executes a command inside the shell container

    ```sh
    bin/docker/exec bash
    ```

- `bin/docker/tail` - tail logs in a container

    ```sh
    bin/docker/tail web
    bin/docker/tail webpack
    ```

- `bin/docker/rails` - executes a rails command inside the shell container

    ```sh
    bin/docker/rails c
    bin/docker/rails db:migrate
    ```

### Debugging with Docker

1. Add a breakpoint to the project

    ```ruby
    binding.pry
    ```

2. Attach to the appropriate container to debug

    ```sh
    bin/docker/attach web
    ```

3. Detach from the container when finished

    ```sh
    <CTRL-P><CTRL-Q>
    ```

[![](http://img.youtube.com/vi/Fbo21aWFbhQ/0.jpg)](http://www.youtube.com/watch?v=Fbo21aWFbhQ "")
