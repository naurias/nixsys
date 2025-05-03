


home packages are added in home/features
home services and configs are also added in same setup
cli one are in cli directory and desktop settings ones are in desktop folder


features is basically what i used to do with home.file stuff or dotfile management.. in addition to that the packages are being added individually depending upon the features i want in their respective nixfiles. Also to use the they are to be enabled in home/nix/nixreaper.nix 


add x.nix in feature/desk or cli
add its imports in default.nix of that folder
add it in nixreaper.nix enable

tradition dotfiles are stored in home/nix/dotfiles



The process is same for system but instead we use following




systemwide services and configs are added in hosts/common/extraservices


add x.nix in extra services folder
import x.nix in in default.nix of services folder
import ./extra or any new add folder such as superextraservices in default.nix of common folder

option should be enable in hosts/nixreaper/default.nix (incase of home its in home/nix/nixreapoer.nix)


for COMMON SERVICES DO USE EXTRAFEATURES. hosts/nixreaper/services IS ONLY FOR SERVICES THAT IS APPLIED ABSOLUTELY AND HAS NO ENABLE OPTION 

MODULES AND OTHER FLAKES

other flakes such as nvf etc are applied as extraServices as in hosts/common/xx and then enabled in hosts/nixreaper/default.nix
