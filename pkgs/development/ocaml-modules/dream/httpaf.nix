{
  lib,
  buildDunePackage,
  dream,
  dream-pure,
  gluten,
  gluten-lwt-unix,
  h2,
  h2-lwt-unix,
  httpun,
  httpun-lwt-unix,
  httpun-ws,
  lwt,
  lwt_ppx,
  lwt_ssl,
  ssl,
}:

buildDunePackage {
  pname = "dream-httpaf";

  inherit (dream) version src;

  propagatedBuildInputs = [
    gluten
    gluten-lwt-unix
    h2
    dream-pure
    lwt
    lwt_ppx
    lwt_ssl
    ssl
    httpun
    httpun-lwt-unix
    h2-lwt-unix
    httpun-ws
  ];

  doCheck = false;

  meta = (lib.removeAttrs dream.meta [ "longDescription" ]) // {
    description = "Internal: shared http/af stack for Dream (server) and Hyper (client)";
  };
}
