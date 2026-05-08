# debug-image

## Build Docker image

Build for your current architecture:

```bash
docker build -t debug-image:local .
```

Build specifically for arm64 and load it into your local Docker image store:

```bash
docker buildx build --platform linux/arm64 -t debug-image:arm64 --load .
```

Build and push a multi-architecture image (amd64 + arm64):

```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t ghcr.io/<owner>/<repo>:latest \
  --push \
  .
```

## Runtime users

Containers start as `debugroot` by default. This user has passwordless `sudo`.

Switch to the unprivileged `debuguser` account:

```bash
sudo -u debuguser -i
```

## GitHub Actions

The workflow at `.github/workflows/build-push.yml` now builds and pushes both
`linux/amd64` and `linux/arm64` images to GHCR.

