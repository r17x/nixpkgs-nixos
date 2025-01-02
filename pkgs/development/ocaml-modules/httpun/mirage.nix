{
  buildDunePackage,
  httpun,
  httpun-lwt,
  gluten-mirage,
  mirage-flow,
  cstruct,
  lwt,
}:

buildDunePackage {
  pname = "httpun-mirage";

  inherit (httpun) src version;

  propagatedBuildInputs = [
    httpun-lwt
    gluten-mirage
    mirage-flow
    cstruct
    lwt
  ];

  meta = httpun.meta // {
    description = "Mirage support for httpun";
  };
}
