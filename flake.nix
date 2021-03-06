{
  description = ''various vector maths utils for nimrod'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."vecmath-master".dir   = "master";
  inputs."vecmath-master".owner = "nim-nix-pkgs";
  inputs."vecmath-master".ref   = "master";
  inputs."vecmath-master".repo  = "vecmath";
  inputs."vecmath-master".type  = "github";
  inputs."vecmath-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."vecmath-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}