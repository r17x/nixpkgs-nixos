{
  lib,
  fetchFromGitHub,
  buildDunePackage,
  ocaml,
  ocaml-syntax-shims,
  alcotest,
  bigstringaf,
  ppx_let,
  gitUpdater,
}:

buildDunePackage rec {
  pname = "dream";
  version = "1.0.0-alpha8";

  duneVersion = "2";

  minimalOCamlVersion = "4.08";

  src = fetchFromGitHub {
    owner = "aantron";
    repo = pname;
    tag = version;
    hash = "sha256-AJBszLOUVwCXDqryNUkak4UlbmofCkxBIPEm4M0nHEI=";
  };

  checkInputs = [
    alcotest
    ppx_let
  ];
  buildInputs = [ ocaml-syntax-shims ];
  propagatedBuildInputs = [ bigstringaf ];
  doCheck = lib.versionAtLeast ocaml.version minimalOCamlVersion;

  passthru.updateScript = gitUpdater { };

  meta = {
    homepage = "https://aantron.github.io/dream";
    description = "Tidy Web framework for OCaml and ReasonML";
    longDescription = ''
      Dream is a feature-complete Web framework with a simple programming
      model and no boilerplate. It provides only two data types, request and
      response.

      Almost everything else is either a built-in OCaml type, or an
      abbreviation for a bare function. For example, a Web app, known in
      Dream as a handler, is just an ordinary function from requests to
      responses. And a middleware is then just a function from handlers to
      handlers.

      Within this model, Dream adds:

        * Session management with pluggable back ends.
        * A fully composable router.
        * Support for HTTP/1.1, HTTP/2, and HTTPS.
        * WebSockets.
        * GraphQL, including subscriptions and a built-in GraphiQL editor.
        * SQL connection pool helpers.
        * Server-side HTML templates.
        * Automatic secure handling of cookies and forms.
        * Unified, internationalization-friendly error handling.
        * A neat log, and OCaml runtime configuration.
        * Helpers for Web formats, such as Base64url, and a modern cipher.

      Because of the simple programming model, everything is optional and
      composable. It is trivially possible to strip Dream down to just a
      bare driver of the various HTTP protocols.

      Dream is presented as a single module, whose API is documented on one
      page. In addition, Dream comes with a large number of examples.
      Security topics are introduced throughout, wherever they are
      applicable.
    '';
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ r17x ];
  };
}
