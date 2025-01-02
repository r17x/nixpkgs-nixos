{
  buildDunePackage,
  httpun,
  httpun-lwt,
  gluten-lwt-unix,
}:

buildDunePackage {
  pname = "httpun-lwt-unix";

  inherit (httpun) src version;

  propagatedBuildInputs = [
    httpun
    httpun-lwt
    gluten-lwt-unix
  ];

  meta = httpun.meta // {
    description = "Lwt and Unix support for httpun";
  };
}
