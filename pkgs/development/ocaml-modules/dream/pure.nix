{
  lib,
  buildDunePackage,
  alcotest,
  bisect_ppx,
  ppx_expect,
  ppx_yojson_conv,
  base64,
  bigstringaf,
  hmap,
  lwt,
  lwt_ppx,
  uri,
  ptime,
  dream,
}:

buildDunePackage {
  pname = "dream-pure";

  inherit (dream) version src;

  propagatedBuildInputs = [
    base64
    bigstringaf
    hmap
    lwt
    lwt_ppx
    ptime
    uri
  ];

  checkInputs = [
    alcotest
    bisect_ppx
    ppx_expect
    ppx_yojson_conv
  ];

  # TODO: enable tests check when dream nixified.
  doCheck = false;

  meta = (lib.removeAttrs dream.meta [ "longDescription" ]) // {
    description = "Internal: shared HTTP types for Dream (server) and Hyper (client)";
  };
}
