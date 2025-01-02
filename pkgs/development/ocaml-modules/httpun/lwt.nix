{
  buildDunePackage,
  httpun,
  lwt,
  gluten-lwt,
}:

buildDunePackage {
  pname = "httpun-lwt";

  inherit (httpun) src version;

  propagatedBuildInputs = [
    httpun
    lwt
    gluten-lwt
  ];

  meta = httpun.meta // {
    description = "Lwt support for httpun";
  };
}
