{ lib, ... }:


# recursively import all .nix files in this directory

with lib;
let

  # Recursively constructs an attrset of a given directory, the value of attrs is the filetype
  getDir = dir: mapAttrs
    (file: type: 
      if type == "directory" then getDir "${dir}/${file}" else type)
    (builtins.readDir dir);

  # Creates a list of of filepaths from the attrset
  files = dir: collect isString (mapAttrsRecursive (path: type: concatStringsSep "/" path) (getDir dir));
  
  # Filters out files not ending in .nix and this file
  validFiles = dir: map
    (file: ./. + "/${file}")
    (filter (file: hasSuffix ".nix" file && file != "default.nix") (files dir));

in
{
  imports = builtins.trace (validFiles ./.) (validFiles ./.);
}

