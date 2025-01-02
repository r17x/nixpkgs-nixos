{
  buildDunePackage,
  async,
  httpun,
  gluten-async,
}:

buildDunePackage {
  pname = "httpun-async";

  inherit (httpun) src version;

  propagatedBuildInputs = [
    httpun
    async
    gluten-async
  ];

  meta = httpun.meta // {
    description = "Async support for httpun";
  };
}
