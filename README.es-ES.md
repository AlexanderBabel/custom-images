

# custom-images

Este monorepositorio incluye imágenes de Docker personalizadas que se construyen para incluir componentes adicionales personalizados. Aquí tienes un breve resumen del software:

## Imágenes

- [argocd](argocd) Una herramienta para GitOps y CD para Kubernetes
- [owntone](owntone) Una versión personalizada de OwnTone con librespot-java para el [HomePod Connect Hass.io Addon](https://community.home-assistant.io/t/homepod-connect-spotify-on-homepods-with-spotify-connect)
- [spilo](spilo) La imagen Spilo de Zalando con la extensión vchord para Postgres

## Uso

Puedes descargar una imagen utilizando
```bash
docker pull alexbabel/SOFTWARE:VERSION
```
o usar GHCR:
```bash
docker pull ghcr.io/alexanderbabel/SOFTWARE:VERSION
```
